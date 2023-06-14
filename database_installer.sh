#!/bin/bash

set -eu

#-----------------------------------------------------------------------------------------------
#
# DATABASE CONFIGURATION
#
#-----------------------------------------------------------------------------------------------

# Color codes for echo statements
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to echo colored text
print_green() {
    echo -e "${GREEN}$1${NC}"
}

print_red() {
    echo -e "${RED}$1${NC}"
}

# Confirm credentials
print_green "Make sure you are able to log in using the command 'mariadb -u root -p'. This is to ensure that the application is able to read and write to the database"
read -p "Did you confirm if the  the credentials in the .env file are correct?  (Y/N): " confirm
if [[ "$confirm" != "Y" && "$confirm" != "y" ]]; then
    print_red "Script stopped. Please update the credentials in the .env file.  "
    exit 1
fi

# Run database migrations
print_green "CREATING MIGRATION"
sudo venvs/django/bin/python manage.py makemigrations

print_green "RUNNING MIGRATIONS"
sudo venvs/django/bin/python manage.py migrate

print_green "PLEASE ENTER THE CREDENTIALS OF SUPER ADMIN USER"
#create application super user
sudo venvs/django/bin/python manage.py createsuperuser
