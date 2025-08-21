#!/bin/bash

# Aplica migrações
python manage.py migrate

# Cria superusuário via script Python
python manage.py shell << END
from django.contrib.auth import get_user_model
import os

User = get_user_model()
username = os.getenv("DJANGO_SUPERUSER_USERNAME", "Ademir")
email = os.getenv("DJANGO_SUPERUSER_EMAIL", "ademir.jr.88@hotmail.com")
password = os.getenv("DJANGO_SUPERUSER_PASSWORD", "Ademir22")

if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username=username, email=email, password=password)
END

# Inicia o servidor e mantém o processo ativo
exec gunicorn setup.wsgi:application --bind 0.0.0.0:$PORT
