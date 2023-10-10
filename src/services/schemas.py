from dataclasses import dataclass
from datetime import datetime


@dataclass
class TicketInfo:
    url: str
    title: str | None
    price_usd: int
    odometer: int | None
    username: str | None
    phone_number: int | None
    image_url: str | None
    images_count: int | None
    car_number: str | None
    car_vin: str | None
    datetime_found: datetime
    
    def __str__(self):
        return (
            f'{self.url}\n'
            f'{self.title}\n'
            f'{self.price_usd}\n'
            f'{self.odometer}\n'
            f'{self.username}\n '
            f'{self.phone_number}\n'
            f'{self.image_url}\n'
            f'{self.images_count}\n'
            f'{self.car_number}\n'
            f'{self.car_vin}\n'
            f'{self.datetime_found}\n'
        )