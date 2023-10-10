import subprocess
from dataclasses import astuple
from datetime import datetime

import psycopg2

from config.settings import DATABASE
from services.schemas import TicketInfo


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
    
    def add_car(self, data: TicketInfo) -> None:
        self.cursor.execute(
            ''' INSERT INTO used_cars (
                url, title, price_usd,
                odometer, username, phone_number,
                image_url, images_count, car_number,
                car_vin, datetime_found
                ) VALUES (
                    %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
                ) ''', astuple(data))
        self.conn.commit()
    
    def select_all_cars(self) -> list:
        self.cursor.execute('SELECT * FROM used_cars')
        return self.cursor.fetchall()
    
    def count_cars(self) -> int:
        self.cursor.execute('SELECT COUNT(*) FROM used_cars')
        count_fetch = self.cursor.fetchone()
        
        if count_fetch is not None:
            return int(count_fetch[0])
        
        raise ValueError('Count is null')
            
    def show_cars(self) -> None:
        for car in self.select_all_cars():
            print(car)
    
    def clear_table(self) -> None:
        self.cursor.execute('TRUNCATE used_cars')
        self.conn.commit()
    
    def dump_database(self) -> None:
        dump_path = 'database/dumps/'
        timestamp = datetime.now().strftime('%Y-%m-%d__%H-%M-%S')
        dump_filename = f'{dump_path}dump__{timestamp}.sql'

        dump_command = [
            'pg_dump',
            f'--dbname=postgresql://{self.conn.info.user}:{self.conn.info.password}'
            f'@{self.conn.info.host}:{self.conn.info.port}/{self.conn.info.dbname}',
            f'--file={dump_filename}'
        ]
        try:
            subprocess.run(dump_command, shell=False, check=True)
            print(f"Database dumped to {dump_filename}")
        except subprocess.CalledProcessError as e:
            print(f"ERROR DUMP: {e}")