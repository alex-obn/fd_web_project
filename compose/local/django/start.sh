#!/bin/sh

set -o errexit
set -o nounset

python3 manage.py migrate --settings=config.settings.docker
# python3 /app/manage.py collectstatic --noinput --settings=config.settings.docker
python3 /app/manage.py runserver 0.0.0.0:80 --settings=config.settings.docker

