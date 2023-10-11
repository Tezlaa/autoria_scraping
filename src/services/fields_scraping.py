import re
from typing import Optional

from bs4 import BeautifulSoup, ResultSet


class FieldScraping:
    def _get_phone_number_hash(self, soup: BeautifulSoup) -> str:
        script_with_hash = soup.select_one('script[class^="js-user-secure"]')
        
        if script_with_hash is None:
            raise ValueError('Phone hash html block not found')
        
        data_hash = script_with_hash.get('data-hash')
        if data_hash is None:
            raise ValueError('Phone hash not found')
        
        if isinstance(data_hash, list):
            return data_hash[0]
        
        return data_hash
    
    def _get_image_url(self, soup: BeautifulSoup) -> Optional[str]:
        main_block = soup.find('main', class_='auto-content')
        if main_block is None:
            raise ValueError('Not found image main block')
        
        picture = main_block.find('picture')
        if picture is None or isinstance(picture, int):
            return None
        
        main_image = picture.find('source')
        if main_image is None:
            return None
        
        return main_image.get('srcset')  # type: ignore
    
    def _get_images_count(self, soup: BeautifulSoup) -> int:
        images_block = soup.find('a', class_='show-all link-dotted')
        if images_block is not None:
            return int(images_block.text.split(' ')[2])
        
        images_block = soup.find('span', class_='count')
        if images_block is not None:
            image_count_block = images_block.find('span', class_='mhide')  # type: ignore
            if image_count_block is not None:
                return int(image_count_block.text.split(' ')[1])
        
        return 0

    def _get_price_usd(self, soup: BeautifulSoup) -> int:
        price_block = soup.find('span', class_='price_value')
        if price_block is None:
            raise ValueError('Not found price block')

        price_str = price_block.find('strong')
        if price_str is None or isinstance(price_str, int):
            raise ValueError('Not found price text')
        
        price_str_text = price_str.text.replace(' ', '')
        if price_str_text.find('$') != -1:
            return int(price_str_text.replace('$', ''))
        elif price_str.text.find('€') != -1:
            return int(int(price_str_text.replace('€', '')) * 1.06)
        else:
            return int(re.sub(r'\D', '', price_str_text))
                
    def _get_car_number(self, soup: BeautifulSoup) -> Optional[str]:
        car_number = self._find_text(soup, 'span', {'class_': 'state-num'})
        if car_number is None:
            return None
        return car_number.replace(' Ми розпізнали держномер авто на фото та перевірили його за реєстрами МВС.', '')
    
    def _get_vin_code(self, soup: BeautifulSoup) -> Optional[str]:
        car_vin = self._find_text(soup, 'span', {'class_': 'label-vin'})
        if car_vin is not None:
            return car_vin

        car_vin = self._find_text(soup, 'span', {'class_': 'vin-code'})
        if car_vin is not None:
            return car_vin

        return None
    
    def _find_text(self, soup: BeautifulSoup, tag: str, atribute_value: dict) -> Optional[str]:
        find_element = soup.find(tag, **atribute_value)
        return find_element.text if find_element is not None else None
    
    def _get_username(self, soup: BeautifulSoup) -> Optional[str]:
        seller_info = soup.find('div', class_='seller_info_title grey')
        seller_info_company = soup.find('h4', class_='seller_info_name')
        seller_info_person = soup.find('div', class_='seller_info_name')
        
        if seller_info is not None and seller_info.text.strip() == 'Компанія':
            return seller_info_company.text.strip() if seller_info_company is not None else None
        
        return seller_info_person.text.strip() if seller_info_person is not None else None

    def _get_all_tickets(self, soup: BeautifulSoup) -> ResultSet:
        return soup.findAll('section', class_='ticket-item')