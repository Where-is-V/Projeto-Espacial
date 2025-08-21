#!/bin/bash

# Ativa o ambiente virtual, se necessário (Render geralmente já cuida disso)
# source venv/bin/activate

# Coleta os arquivos estáticos
python manage.py collectstatic --noinput
