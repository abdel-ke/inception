all: Dir Build Run

Dir: 
	mkdir -p /home/sqatim/data/wordpress /home/sqatim/data/mariadb
Build:
	@docker-compose -f ./srcs/docker-compose.yml build
Run:
	@docker-compose -f ./srcs/docker-compose.yml up
clean:
	@docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker system prune -a --force

re: fclean all

include srcs/.env

build:
	sudo mkdir -p /home/abdel-ke/data
	sudo mkdir -p /home/abdel-ke/data/DB
	sudo mkdir -p /home/abdel-ke/data/backup
	sudo chown -R root:root /home/abdel-ke/data
	sudo sh -c "echo 127.0.0.1 ${DOMAIN_NAME} >> /etc/hosts"
	cd srcs && sudo docker-compose build
up:
	cd srcs && sudo docker-compose up
down:
	cd srcs && sudo docker-compose down

