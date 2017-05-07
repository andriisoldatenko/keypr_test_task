install:
	pip install -U pip
	pip install -r requirements/local.txt

run:
	python manage.py runserver --settings=pms.settings.local

collectstatic:
	python manage.py collectstatic --settings=pms.settings.local

migrate:
	python manage.py migrate --settings=pms.settings.local

migrations:
	python manage.py makemigrations --settings=pms.settings.local

shell:
	python manage.py shell_plus --settings=pms.settings.local

check_isort:
	@if ! isort -c -rc -m 3 reservations pms; then \
		echo "Import sort errors, run 'make isort' to fix them!!!"; \
		isort --diff -rc -m 3 reservations pms; \
		false; \
	fi

flake:
	@flake8 --exclude=.js,migrations,settings --statistics .

isort:
	isort -rc -m 3 pms
	isort -rc -m 3 reservations

build: install migrate collectstatic
