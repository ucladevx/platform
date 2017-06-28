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

docker-reset:
	-sudo docker ps -a | cut -d ' ' -f 1 | xargs sudo docker rm
	-sudo docker images | tr -s ' ' | cut -d ' ' -f 3 | xargs sudo docker rmi --force