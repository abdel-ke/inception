ls:
	@echo "\033[32m____________IMAGES__________\033[0m"
	@docker images
	@echo "\033[32m__________CONTAINERS_OFF__________\033[0m"
	@docker ps -a
up:
	docker-compose -f ./srcs/docker-compose.yml up
stop:
	docker-compose -f ./srcs/docker-compose.yml down
reload:
	docker-compose -f ./srcs/docker-compose.yml stop
	sudo rm -rf /home/abdel-ke/data/DB/*
	sudo rm -rf /home/abdel-ke/data/WordPress/*
	docker-compose -f ./srcs/docker-compose.yml up
build:
	docker-compose -f ./srcs/docker-compose.yml build
data:
	sudo rm -rf /home/abdel-ke/data/DB/*
	sudo rm -rf /home/abdel-ke/data/WordPress/*