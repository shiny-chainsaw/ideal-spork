.PHONY : clean distclean test

all : clean venv/bin/activate requirements.txt test run

clean : 
	find . -path './venv' -prune \
		-o \( -name '*.egg-info' \
		-o -name '*.pyc' \
		-o -name '*.pyo' \
		-o -name '__pycache__' \
		-o -name '.pytest_cache' \) \
		-exec rm -rf {} +

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
	$(error This target has not been implemented)
