from config import settings

from celery import Celery
from celery.schedules import crontab


app = Celery('celery_app')
app.config_from_object(settings, namespace='CELERY')


# celery beat
app.conf.beat_schedule = {
    'create-task-scraping-every-12-pm': {
        'task': 'services.tasks.scraping_site_task',
        'schedule': crontab(minute='*/1'),
    },
    'create-task-dump-every-12-am': {
        'task': 'services.tasks.create_database_dump_task',
        'schedule': crontab(minute='*/1'),
    }
}