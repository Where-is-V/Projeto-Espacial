#!/bin/bash

python manage.py migrate
python manage.py createsuperuser --noinput
gunicorn setup.wsgi:application --bind 0.0.0.0:$PORT
