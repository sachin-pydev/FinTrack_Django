#!/usr/bin/env bash
set -e

# Upgrade pip
python -m pip install --upgrade pip

# Install dependencies
pip install -r requirements.txt

# Apply migrations
python core/manage.py migrate --noinput

# Collect static files
python core/manage.py collectstatic --noinput

# Start Gunicorn
exec gunicorn core.core.wsgi:application \
    --bind 0.0.0.0:10000 \
    --workers 3
