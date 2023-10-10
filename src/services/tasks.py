from celery import shared_task


@shared_task()
def scraping_site_task() -> None:
    print('scraping site')


@shared_task()
def create_database_dump_task() -> None:
    print('dump database')