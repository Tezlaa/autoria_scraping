import os

from dotenv import load_dotenv


load_dotenv()


DOCKER_RUN = bool(os.getenv('DOCKER_RUN'))

DATABASE = {
    'NAME': os.getenv('POSTGRES_DB'),
    'USER': os.getenv('POSTGRES_USER'),
    'PASSWORD': os.getenv('POSTGRES_PASSWORD'),
    'HOST': os.getenv('POSTGRES_HOST') if DOCKER_RUN else 'localhost',
    'PORT': '5432',
}

REDIS_HOST = os.getenv('REDIS_HOST') if not DOCKER_RUN else 'redis'
REDIS_PORT = os.getenv('REDIS_PORT')

CELERY_BROKER_URL = 'redis://{}:{}/0'.format(REDIS_HOST, REDIS_PORT)
CELERY_RESULT_BACKEND = CELERY_BROKER_URL
CELERY_ACCEPT_CONTENT = ['json']
CELERY_TASK_SERIALIZER = 'json'
CELERY_RESULT_SERIALIZER = 'json'