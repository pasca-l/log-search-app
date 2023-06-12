include .env

.PHONY: start

start:
	flutter pub get
	flutter run -d web-server --web-port=${PORT} --web-hostname=${HOST}
