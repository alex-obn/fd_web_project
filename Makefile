DOCKERCOMPOSE := CURRENT_UID=$(USERID):$(GROUPID) docker-compose -f compose-local.yml

# Local run:
makemigrations:
	python manage.py makemigrations --settings=config.settings.dev
migrate:
	python manage.py migrate --settings=config.settings.dev
up:
	python manage.py runserver 8100 --settings=config.settings.dev

# Run with docker-compose:
create_network:
	docker network create --driver bridge --subnet=173.28.0.0/16 --gateway 173.28.1.1 file_store_docker_net &>/dev/null || true
compose_build:
	${DOCKERCOMPOSE} build
compose_makemigrations:
	${DOCKERCOMPOSE} run --rm django python manage.py makemigrations ${app} --settings=config.settings.docker
compose_migrate:
	${DOCKERCOMPOSE} run --rm django python manage.py migrate --settings=config.settings.docker
compose_up: create_network
	${DOCKERCOMPOSE} up