# Alpine powered container for Laravel projects
This is a small project I started to effciently start Laravel projects with reduced dev ops delays.

# What does it include?
The container includes the following packages installed on Alpine:

- PHP 7.x from apk services
- PHP extensions: apache2, openssl, mbstring, phar, pdo, tokenizer, mysqli, mysqlnd
- Composer (TODO)
- NodeJS (TODO)
- MySQL (TODO)

# Usage examples
Run the docker command to pull the image from the Docker repo.
```
docker pull johnnyhuy/laravel
```

## Production use
Use the following command to run with daemon (in background).
```
docker run -d johnnyhuy/laravel
```

## Development use
Use the following command to run without daemon.
```
docker run -it johnnyhuy/laravel
```

# Future plans
- Add Postgres DB support

Sidenote: This is a work in progress so most of the instructions are not complete.