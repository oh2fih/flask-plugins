.PHONY: clean help sdist release release-test develop test

help:
	@echo "  clean           remove unwanted files"
	@echo "  sdist           build source distribution"
	@echo "  release         build and upload to PyPI"
	@echo "  release-test    build and upload to TestPyPI"
	@echo "  develop         install package in editable mode"
	@echo "  test            run tests with pytest"

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '.DS_Store' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '.coverage' -exec rm -rf {} +

sdist:
	python -m build --sdist

release: sdist
	twine upload dist/*

release-test: sdist
	twine upload --repository testpypi dist/*

develop:
	pip install -e .

test:
	pytest
