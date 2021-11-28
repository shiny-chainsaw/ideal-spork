.PHONY : clean distclean test

all : clean venv/bin/activate requirements.txt test run

clean : 
	git clean -dx --exclude=.idea/ --exclude=venv/ --force

distclean :
	git reset --hard
	git clean -dx --force

venv/bin/activate :
	python3 -m venv venv

requirements.txt : venv/bin/activate
	venv/bin/python3 -m pip install --upgrade pip
	venv/bin/pip install --requirement requirements.txt

test : requirements.txt
	venv/bin/pytest

black :
	venv/bin/black .

run : requirements.txt
	venv/bin/gunicorn "api:create_app()" \
 		--bind 0.0.0.0:5000 \
 		--threads 4 \
 		--workers 2
