#!/bin/bash

# Ativa o ambiente virtual, se necessário (Render geralmente já cuida disso)
# source venv/bin/activate

# Coleta os arquivos estáticos
python manage.py collectstatic --noinput
#
python manage.py makemigrations --noinput
# Cria as migrações do banco de dados
python manage.py migrate --noinput  
# Aplica as migrações do banco de dados

