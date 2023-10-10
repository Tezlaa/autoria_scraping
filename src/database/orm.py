import psycopg2

from config.settings import DATABASE


class Database:
    def __init__(self) -> None:
        self.conn = psycopg2.connect(
            database=DATABASE.get('NAME'),
            host=DATABASE.get('HOST'),
            user=DATABASE.get('USER'),
            password=DATABASE.get('PASSWORD'),
            port=DATABASE.get('PORT'),
        )
        self.cursor = self.conn.cursor()
        
        self.cursor.execute(
            '''CREATE TABLE IF NOT EXISTS used_cars (
                id serial PRIMARY KEY,
                url VARCHAR(256),
                title VARCHAR(256),
                price_usd INTEGER,
                odometer INTEGER,
                username VARCHAR(256),
                phone_number INTEGER,
                image_url VARCHAR(256),
                images_count INTEGER,
                car_number VARCHAR(256),
                car_vin VARCHAR(256),
                datetime_found TIMESTAMP
            )'''
        )
        self.conn.commit()
    
    