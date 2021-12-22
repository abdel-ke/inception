all: down data build up

domain:
	sudo sed -i "1 s/localhost/abdel-ke.42.fr/" /etc/hosts
folders: data
	@mkdir -p ~/data/DB
	@mkdir -p ~/data/WordPress
	@mkdir -p ~/data/backup
ls:
	@echo "\033[32m__________CONTAINERS_OFF__________\033[0m"
	@docker ps -a
	@echo "\033[32m______________IMAGES__________\033[0m"
	@docker images
	@echo "\033[32m______________VOLUMES__________\033[0m"
	@docker volume ls
	@echo "\033[32m______________Network__________\033[0m"
	@docker network ls
build:
	docker-compose -f ./srcs/docker-compose.yml build

up: folders domain
	docker-compose -f ./srcs/docker-compose.yml up -d

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	docker-compose -f ./srcs/docker-compose.yml down

logs:
	docker-compose -f ./srcs/docker-compose.yml logs

reload: rm all

data:
	sudo rm -rf ~/data/*

rm:
	docker system prune -a --force
