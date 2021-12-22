locationWinHost=/mnt/c/Windows/System32/drivers/etc/hosts
all: down data build up

domain:
# for linux
	sudo sed -i '/127.0.0.1/s/localhost/abdel-ke.42.fr/' /etc/hosts
# for windows
# sed -i "s/#   127.0.0.1       localhost/127.0.0.1       localhost abdel-ke.42.fr/" $(localhost)
folders: data
	@sudo mkdir -p /mnt/c/Users/kemma/Desktop/data/DB
	@sudo mkdir -p /mnt/c/Users/kemma/Desktop/data/WordPress
	@sudo mkdir -p /mnt/c/Users/kemma/Desktop/data/backup
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
	sudo rm -rf /mnt/c/Users/kemma/Desktop/data/*

rm:
	docker system prune -a --force
