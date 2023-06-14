#!/bin/bash

set -eu

#-----------------------------------------------------------------------------------------------
#
# APPLICATION INSTALLER
#
#-----------------------------------------------------------------------------------------------


## SCRIPT INSTALLATION
#enable apache mod rewrite
sudo a2enmod rewrite

#install python-venv
sudo apt install python3.10-venv

# Clone the repository from GitHub
sudo git clone https://github.com/mashcom/originality-integration-fiverr

#remove previous installations
sudo rm -r originality-integration-fiverr

# Navigate to the cloned repository
cd originality-integration-fiverr

#create the .env file
sudo cp .env_example .env

# Create a directory for virtual environments
sudo mkdir .venvs

# Create a virtual environment for Django
sudo python3 -m venv venvs/django

# Activate the virtual environment
source venvs/django/bin/activate

# Create a log file for Django
sudo touch logs/django.log

# Set permissions for the log file
sudo chmod 0777 logs/django.log

# Change ownership of the repository to www-data user and group
sudo chown -R www-data:www-data .

# Set directory permissions
sudo chmod 0777 .

# Install Python dependencies
sudo venvs/django/bin/pip install -r requirements.txt


