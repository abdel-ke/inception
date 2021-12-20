all: build up

domain:
	sudo sed -i "1 s/DOMAIN_NAME/abdel-ke.42.fr/" /etc/hosts
folders:
	@mkdir -p ~/data
	@mkdir -p ~/data/DB
	@mkdir -p ~/data/WordPress
	@mkdir -p ~/data/backup
ls:
	@echo "\033[32m____________IMAGES__________\033[0m"
	@docker images
	@echo "\033[32m__________CONTAINERS_OFF__________\033[0m"

	@docker ps -a
	
up: folders domain
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

reload: data folders
	docker-compose -f ./srcs/docker-compose.yml down
	docker-compose -f ./srcs/docker-compose.yml up --build

build: folders
	docker-compose -f ./srcs/docker-compose.yml build

data:
	sudo rm -rf ~/data/DB
	sudo rm -rf ~/data/WordPress
	sudo rm -rf ~/data/backup
