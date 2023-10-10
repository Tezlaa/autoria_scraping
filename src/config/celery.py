from config import settings

from celery import Celery
from celery.schedules import crontab


app = Celery('config')
app.config_from_object(settings, namespace='CELERY')
app.conf.include = ['tasks']


# celery beat
app.conf.beat_schedule = {
    'create-task-scraping-every-12-pm': {
        'task': 'tasks.scraping_site_task',
        'schedule': crontab(hour='12', minute='0'),
    },
    'create-task-dump-every-12-am': {
        'task': 'tasks.create_database_dump_task',
        'schedule': crontab(hour='0', minute='0'),
    }
}