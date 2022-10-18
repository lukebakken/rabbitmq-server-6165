.PHONY: build run setup

setup:
	$(CURDIR)/setup.sh

build: setup
	docker build --tag rabbitmq-server-6165:latest --pull --no-cache .

run: build
	docker run --publish 15671:15671 rabbitmq-server-6165:latest
