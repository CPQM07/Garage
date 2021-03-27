create_app: docker-compose run web rails new . --force --no-deps --database=postgresql
create: docker-compose run web rake db:create
migrate: docker-compose run web rake db:migrate
build: docker-compose build
run: docker-compose up