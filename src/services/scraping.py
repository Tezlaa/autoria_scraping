from datetime import datetime

import requests

from bs4 import BeautifulSoup, ResultSet

from fake_useragent import UserAgent

from database.orm import Database

from services.schemas import TicketInfo
from services.fields_scraping import FieldScraping


class Scraping(FieldScraping):
    def __init__(self, url_main_page: str, database: Database) -> None:
        self.url = url_main_page
        self.database = database
    
    def start_scraping(self) -> None:
        page = self.url
        all_tickets = self.__get_all_tickets_in_page(page)
        
        while all_tickets != 0:
            for ticket in all_tickets:
                ticket_link = self.__get_ticket_link(ticket)
                ticket_page = self.get_page_response(ticket_link).text
                ticket_data = self.__scraping_ticket_page(
                    ticket_link,
                    BeautifulSoup(ticket_page, 'html.parser'),
                )
                
                self.database.add_car(ticket_data)
            
            page = self.get_new_page(page)
            all_tickets = self.__get_all_tickets_in_page(page)
    
    def get_new_page(self, url: str) -> str:
        index_number_page_start = url.find('&page=') + 1
        index_number_page_end = url.find('&', index_number_page_start)
        
        current_page = int(url[index_number_page_start + 5: index_number_page_end])
        
        return url.replace(url[index_number_page_start - 1: index_number_page_end], f'&page={current_page + 1}')
    
    def get_page_response(self, url: str) -> requests.Response:
        headers = {
            'User-Agent': UserAgent().random
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        
        return response
    
    def __get_all_tickets_in_page(self, url: str) -> ResultSet:
        main_page = self.get_page_response(url).text
        soup_main_page = BeautifulSoup(main_page, 'html.parser')
        return self.get_all_tickets(soup_main_page)
    
    def __scraping_ticket_page(self, ticket_url: str, soup: BeautifulSoup) -> TicketInfo:
        car_id = int(ticket_url.split('_')[-1].split('.html')[0])
        phone_number = self.__get_phone_number(car_id, soup)
        title = self.find_text(soup, 'h3', {'class_': 'auto-content_title'})
        price_usd = self.get_price_usd(soup)
        odometer = self.__convert_odometer(self.find_text(soup, 'div', {'class_': 'bold dhide'}))
        username = self.get_username(soup)
        image_url = self.get_image_url(soup)
        images_count = self.get_images_count(soup)
        car_vin = self.get_vin_code(soup)
        car_number = self.get_car_number(soup)
        datetime_found = datetime.now()
        
        return TicketInfo(
            url=ticket_url, price_usd=price_usd, odometer=odometer,
            username=username, phone_number=phone_number, image_url=image_url,
            images_count=images_count, car_vin=car_vin, datetime_found=datetime_found,
            title=title, car_number=car_number,
        )
    
    def __convert_odometer(self, thousands_str: str | None) -> int:
        if thousands_str is None:
            raise ValueError('Odometer is not found')
        
        thousands = thousands_str.strip().split(' ')[0] + '000'
        return int(thousands)
        
    def __get_phone_number(self, car_id: int, soup: BeautifulSoup) -> int:
        data_hash = self.get_phone_number_hash(soup)
        api_url = f'https://auto.ria.com/users/phones/{car_id}?hash={data_hash}'
        number = self.get_page_response(api_url).json().get('formattedPhoneNumber')
        currect_format_number = number.strip().replace('(', '').replace(')', '').replace(' ', '')
        return int(currect_format_number)
        
    def __get_ticket_link(self, ticket) -> str:
        address_tag = ticket.find('a', class_='address')
        return address_tag.get('href')
