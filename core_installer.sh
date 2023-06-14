#!/bin/bash

set -eu

# Update package lists
sudo apt-get update

# Install necessary packages
sudo apt-get install apache2                # Apache HTTP Server
sudo apt-get install apache2-dev            # Apache development headers and module support
sudo apt-get install build-essential         # Essential build tools
sudo apt-get install python3-dev             # Python 3 development headers
sudo apt-get install libapache2-mod-wsgi-py3  # Apache module for hosting Python WSGI applications
sudo apt-get install libpq-dev              # PostgreSQL development headers
sudo apt-get install netcat                 # Networking utility for reading from/writing to network connections
sudo apt-get install default-libmysqlclient-dev   # MySQL development headers
sudo apt-get install  libmagic-dev             # Development files for libmagic, a file type detection library

# Remove cached package lists
sudo rm -rf /var/lib/apt/lists/*

# Update package lists again
sudo apt-get update


#install snapd
sudo apt update
sudo apt install snapd
sudo snap install core; sudo snap refresh core

#install certbot
sudo apt-get remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot

# Install MariaDB server
sudo apt-get install mariadb-server

# Start MariaDB service
sudo systemctl start mariadb

# Secure MariaDB installation
sudo mysql_secure_installation


#flush tables
#sudo mariadb -u root -p <<EOF
#GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
#FLUSH PRIVILEGES;
#EOF

