init: docker-down \
	docker-pull docker-build docker-up \
	app-composer-install echo-hosts \
	echo-open-browser
up: docker-up
down: docker-down
restart: down up

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build --pull

app-composer-install:
	docker-compose run --rm php-cli composer install

app-migrations:
	docker-compose run --rm php-cli bin/console d:m:m --no-interaction

# yarn-install:
# 	docker-compose run --rm node-cli yarn install
#
# yarn-dev:
# 	docker-compose run --rm node-cli yarn dev
#
# yarn-watch:
# 	docker-compose run --rm node-cli yarn watch
#
# yarn-add:
# 	docker-compose run --rm node-cli yarn add ${PACK}

echo-hosts:
	sudo sh -c "echo '127.0.0.1 api.local' >> /etc/hosts"

#echo-address:
#	echo -en "\n \033[37;1;41m marchellis.local \033[0m"

echo-open-browser:
	xdg-open http://api.local/
