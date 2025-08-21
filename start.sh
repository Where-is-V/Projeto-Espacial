#!/bin/bash

python manage.py migrate
python manage.py shell < create_superuser.py
gunicorn setup.wsgi:application --bind 0.0.0.0:$PORT
