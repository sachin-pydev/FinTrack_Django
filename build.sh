#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install dependencies (just in case Render didn't do it)
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

# Run migrations
python core/manage.py migrate

# Collect static files
python core/manage.py collectstatic --noinput
