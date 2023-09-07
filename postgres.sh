#!/bin/bash

# Update the package list
sudo apt-get update

# Install PostgreSQL
sudo apt-get install -y postgresql

# Start and enable the PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Verify the installation
sudo -u postgres psql -c "SELECT version();"

# Optional: Set a password for the PostgreSQL user "postgres"
sudo -u postgres psql <<EOF
\password postgres
EOF

# Optional: Create a new database (replace "yourdb" with your desired database name)
sudo -u postgres psql <<EOF
CREATE DATABASE yourdb;
EOF

echo "PostgreSQL installation completed."
