setup:
	./setup.sh

stack:
	python stack_gen.py

build:
	sudo docker-compose build

dev: build
	sudo docker-compose up

run:
	sudo docker-compose up -d