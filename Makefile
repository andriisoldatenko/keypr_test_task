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

clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -f `find . -type f -name '@*' `
	rm -f `find . -type f -name '#*#' `
	rm -f `find . -type f -name '*.orig' `
	rm -f `find . -type f -name '*.rej' `
	rm -f .coverage
	rm -rf coverage
	rm -rf build
	rm -rf cover

coverage:
	py.test --cov-report term-missing --cov

test:
	pytest

build: install migrate collectstatic
