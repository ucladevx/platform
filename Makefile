setup:
	./setup.sh

stack:
	python stack_gen.py

build:
	if [ -f golang/Makefile ]; then cd golang && make build && cd ..; fi
	docker-compose build

dev:
	docker-compose up

run:
	docker-compose up -d