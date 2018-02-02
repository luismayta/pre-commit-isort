#
# See ./CONTRIBUTING.rst
#

TAG :=""
END :=""
OS := $(shell uname)
.PHONY: help build up requirements clean lint test help
.DEFAULT_GOAL := help

PROJECT := pre-commit-isort
PROJECT_DEV := $(PROJECT)_dev
PROJECT_STAGE := $(PROJECT)_stage
PROJECT_TEST := $(PROJECT)_test

PYTHON_VERSION=3.6.1
PYENV_NAME="${PROJECT}"

# Configuration.
SHELL := /bin/bash
ROOT_DIR=$(shell pwd)
MESSAGE:=༼ つ ◕_◕ ༽つ
MESSAGE_HAPPY:="${MESSAGE} Happy Coding"
SOURCE_DIR=$(ROOT_DIR)/
REQUIREMENTS_DIR=$(ROOT_DIR)/requirements
FILE_README:=$(ROOT_DIR)/README.rst

pip_install := pip install -r

include *.mk

help:
	@echo '${MESSAGE} Makefile for ${PROJECT}'
	@echo ''
	@echo 'Usage:'
	@echo '    environment               create environment with pyenv'
	@echo '    install                   install dependences python by env'
	@echo '    clean                     remove files of build'
	@echo '    setup                     install requirements'
	@echo ''
	@make alias.help

clean:
	@echo "$(TAG)"Cleaning up"$(END)"
ifneq (Darwin,$(OS))
	@sudo rm -rf .tox *.egg dist build .coverage
	@sudo rm -rf docs/build
	@sudo find . -name '__pycache__' -delete -print -o -name '*.pyc' -delete -print -o -name '*.tmp' -delete -print
else
	@rm -rf .tox *.egg dist build .coverage
	@rm -rf docs/build
	@find . -name '__pycache__' -delete -print -o -name '*.pyc' -delete -print -o -name '*.tmp' -delete -print
endif
	@echo

setup: clean
	$(pip_install) "${REQUIREMENTS_DIR}/setup.txt"
	pre-commit install
	cp -rf extras/git/hooks/prepare-commit-msg .git/hooks/

environment: clean
	@if [ -e "$(HOME)/.pyenv" ]; then \
		eval "$(pyenv init -)"; \
		eval "$(pyenv virtualenv-init -)"; \
	fi
	pyenv virtualenv "${PYTHON_VERSION}" "${PYENV_NAME}" >> /dev/null 2>&1 || echo 'Oh Yeah!!'
	pyenv activate "${PYENV_NAME}" >> /dev/null 2>&1 || echo 'Oh Yeah!!'

install: clean
	@echo $(MESSAGE) "Deployment environment: ${env}"
	@if [ "${env}" == "" ]; then \
		$(pip_install) requirements.txt; \
	else \
		$(pip_install) "${REQUIREMENTS_DIR}/${env}.txt"; \
	fi
