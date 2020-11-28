mysql:
	docker run --name mysql \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=admin \
	-d mysql \
	&& \
	docker run --name phpmyadmin \
	-p 8081:80 -d \
	--link mysql:db \
	phpmyadmin/phpmyadmin

mongo:
	docker run --name mongo \
	-p 27017:27017 \
	-d mongo

redis:
	docker run --name redis \
	-p 6379:6379 \
	-d redis

postgres:
	docker network create --driver bridge pgnetwork || true && \
	docker run --name postgres \
	-p 5432:5432 \
	--network="pgnetwork" \
	-e POSTGRES_USER=admin \
	-e POSTGRES_PASSWORD=admin \
	-d postgres \
	&& \
	docker run --name pgadmin \
	-p 8080:80 \
	--network="pgnetwork" \
	-e PGADMIN_DEFAULT_EMAIL=admin@admin.com \
	-e PGADMIN_DEFAULT_PASSWORD=admin \
	-d dpage/pgadmin4 \
