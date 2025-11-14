#!/usr/bin/env bash

# Exit on any error
set -e

# Activate virtual environment if exists
if [ -d ".venv" ]; then
    source .venv/bin/activate
fi

# Upgrade pip
pip install --upgrade pip

# Install requirements
pip install -r requirements.txt

# Make sure static files go to correct folder
python core/manage.py collectstatic --noinput

# Apply migrations
python core/manage.py migrate --noinput

# Set environment variable for Django settings (in case not set in Render)
export DJANGO_SETTINGS_MODULE=core.core.settings

# Start Gunicorn
exec gunicorn core.core.wsgi:application \
    --bind 0.0.0.0:10000 \
    --workers 3
