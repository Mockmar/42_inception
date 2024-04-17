all: up

up:
	mkdir -p /home/jgautier/data/wordpress
	mkdir -p /home/jgautier/data/mysql
	docker compose -f srcs/docker-compose.yml build
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker system prune -af
	docker compose -f srcs/docker-compose.yml down --volumes

cleandb:
	sudo rm -rf /home/jgautier/data

fclean: clean cleandb

.PHONY: all down clean cleandb fclean
