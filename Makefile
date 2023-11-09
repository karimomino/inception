all:
	docker compose -f ./src/docker-compose.yml up -d --build

down:
	docker compose -f ./src/docker-compose.yml down

re:
	docker compose -f src/docker-compose.yml up -d --build

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf /home/kamin/data/wordpress/*
	rm -rf /home/kamin/data/mariadb/*

.PHONY: all re down clean