from celery import shared_task
from database.orm import Database

from services.scraping import Scraping


@shared_task()
def scraping_site_task() -> None:
    url = 'https://auto.ria.com/uk/search/?lang_id=4&page=0&countpage=100&indexName=auto&custom=1&abroad=2'
    
    database = Database()
    if database.count_cars() > 0:
        database.clear_table()
        
    Scraping(url, database).start_scraping()


@shared_task()
def create_database_dump_task() -> None:
    database = Database()
    database.dump_database()
    database.clear_table()