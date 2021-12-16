up:
	cd ./srcs
	docker-compose up
down:
	cd ./srcs
	docker-compose down
reload:
	cd ./srcs
	docker-compose stop
	sudo rm -rf /home/abdel-ke/data/DB/*
	sudo rm -rf /home/abdel-ke/data/WordPress/*
	docker-compose up
build:
	cd ./srcs
	docker-compose build