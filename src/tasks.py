from celery import shared_task
from database.orm import Database

from services.scraping import Scraping


@shared_task()
def scraping_site_task() -> None:
    url = 'https://auto.ria.com/uk/search/?lang_id=4&page=0&countpage=100&indexName=auto&custom=1&abroad=2'
    Scraping(url, Database()).start_scraping()


@shared_task()
def create_database_dump_task() -> None:
    Database().dump_database()