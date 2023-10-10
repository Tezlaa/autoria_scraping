from services.scraping import Scraping
from database.orm import Database


# For testing. Without celery beats
if __name__ == "__main__":
    url = 'https://auto.ria.com/uk/search/?lang_id=4&page=0&countpage=100&indexName=auto&custom=1&abroad=2'
    
    database = Database()

    if database.count_cars() > 0:
        database.dump_database()
    database.clear_table()
    
    Scraping(url, database).start_scraping()
    database.dump_database()