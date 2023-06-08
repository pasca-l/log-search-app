include .env

.PHONY: start

start:
	docker-compose up -d
	docker attach ${APP_CONTAINER_NAME}
