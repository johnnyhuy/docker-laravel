# Alpine powered container for Laravel projects
This is a small project I started to effciently start Laravel projects with reduced dev ops delays.

# What does it include?
The container includes the following packages installed on Alpine:

- PHP 7.x from apk services
- PHP extensions: apache2, openssl, mbstring, phar, pdo, tokenizer, mysqli, mysqlnd
- Composer
- NodeJS (TODO)

# Usage examples
Run the docker command to pull the image from the Docker repo.
```
docker pull johnnyhuy/laravel
```

## I want to use develop on my Laravel project without rebuilding it
This is where volumes are used to interact with the container project file. Run the following command to link your project folder.

```

```

## I want to use MySQL on my Laravel project
We'll be using docker compose to create a config file to include the MySQL image and link it to the johnnyhuy/laravel image. Create a docker-compose.yml as shown.

```

```

## Production use
Use the following command to run with daemon (in background).
```
docker run -p 80:80 -p 443:443 -d johnnyhuy/laravel
```

## Development use
Use the following command to run without daemon.
```
docker run -it johnnyhuy/laravel
```


**Sidenote:** This is a work in progress.