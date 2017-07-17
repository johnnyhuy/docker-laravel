# Alpine powered container for Laravel projects
This is a small project I started to effciently start Laravel projects with reduced dev ops delays.

# What does it include?
The container includes the following packages installed on Alpine:

- Core utilities: curl, unzip
- PHP 7.x from apk services
- PHP extensions: apache2, openssl, mbstring, phar, pdo, tokenizer, mysqli, mysqlnd...
- PHP Composer
- NodeJS & npm

# Usage
## Quick (no database)
This is where volumes are used to interact with the container project file. Run the following command to link your project folder.

Run the docker command to pull the image from the Docker repo.
```
docker pull johnnyhuy/laravel
```

Start a container from the image you have downloaded.
```
docker run -p 80:80 -v $PWD:/var/www/laravel -d johnnyhuy/laravel
```
Note: $PWD is the current directory.

## Recommended for development (includes MySQL driver)
We'll be using docker compose to create a config file to include the MySQL image and link it to the johnnyhuy/laravel image. Create a **docker-compose.yml** in your project folder as shown.

```
version: "3"
services:
    web:
        build: ./
        image: johnnyhuy/laravel:latest
        ports:
            - "80:80"
        volumes:
            - .:/var/www/laravel
        links:
            - "db:database"
    db:
        image: mysql
        ports:
            - 3306:3306
        environment:
            MYSQL_ROOT_PASSWORD: "YOUR ROOT PASSWORD HERE"
            MYSQL_DATABASE: "YOU MYSQL DATABASE NAME HERE (OPTIONAL)"
```

## Production use
### Step 1
Create a **docker-compose.yml** in your project folder as shown. Be sure to replace MySQL root password and database.
```
version: "3"
services:
    web:
        build: ./
        image: johnnyhuy/laravel:latest
        ports:
            - "80:80"
            - "443:443"
        links:
            - "db:database"
    db:
        image: mysql
        ports:
            - 3306:3306
        environment:
            MYSQL_ROOT_PASSWORD: "YOUR ROOT PASSWORD HERE"
            MYSQL_DATABASE: "YOU MYSQL DATABASE NAME HERE (OPTIONAL)"
```
Note: this is similar to the development method but without the volumes.

### Step 2
Download the Dockerfile from this [git](https://github.com/johnnyhuy/docker-laravel/blob/master/Dockerfile) or [docker](https://hub.docker.com/r/johnnyhuy/laravel/~/dockerfile/) repository.

### Step 3
Build the docker image by running the following command.
```
docker-compose build
```

### Step 4
Run the container.
```
docker-compose up -d
```


**Sidenote:** This is a work in progress.