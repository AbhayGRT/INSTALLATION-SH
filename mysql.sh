#!/bin/bash

# Update the package list
sudo apt update

# Install MySQL Server
sudo apt install mysql-server

# Start the MySQL service
sudo systemctl start mysql

# Enable MySQL to start on system boot
sudo systemctl enable mysql

# Log in to MySQL as the root user (you'll be prompted for the password)
mysql -u root -p
