.PHONY: setup start stop restart clean help

setup:
	@echo "Setting up environment..."
	chmod +x scripts/*.sh

start:
	@echo "Starting Docker Compose..."
	docker compose up -d

stop:
	@echo "Stopping Docker Compose..."
	docker compose down

restart:
	@echo "Recreating Docker Compose..."
	docker compose up -d --force-recreate

clean:
	@echo "Cleaning up Docker containers and volumes..."
	docker compose down -v

help:
	@echo "Available commands:"
	@echo "  make setup    - Make all shell scripts executable"
	@echo "  make start    - Start Docker Compose containers"
	@echo "  make stop     - Stop Docker Compose containers"
	@echo "  make restart  - Recreate and start containers"
	@echo "  make clean    - Stop and remove all containers and volumes"

