makemigrations:
	python manage.py makemigrations --settings=config.settings.dev
migrate:
	python manage.py migrate --settings=config.settings.dev
up:
	python manage.py runserver 8100 --settings=config.settings.dev
