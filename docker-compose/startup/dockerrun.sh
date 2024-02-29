#!/bin/sh

cd /var/www/

# echo pwd

# if [-f "composer.json" ]; then
#     composer install
# else
#     composer create-project laravel/laravel app-data
#     echo "isntall alravel"
# fi

composer install

php artisan migrate --seed

#mv ./myApp/* ./