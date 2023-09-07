#!/bin/bash

# Update the package list and install PostgreSQL
sudo apt update
sudo apt install postgresql postgresql-contrib

# Start and enable the PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Set a password for the default PostgreSQL user (postgres)
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'your_password';"

# Create a new PostgreSQL user and database (optional)
# Replace 'new_user' and 'new_db' with your desired username and database name
# sudo -u postgres psql -c "CREATE USER new_user WITH PASSWORD 'new_password';"
# sudo -u postgres psql -c "CREATE DATABASE new_db;"
# sudo -u postgres psql -c "ALTER ROLE new_user SET client_encoding TO 'utf8';"
# sudo -u postgres psql -c "ALTER ROLE new_user SET default_transaction_isolation TO 'read committed';"
# sudo -u postgres psql -c "ALTER ROLE new_user SET timezone TO 'UTC';"
# sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE new_db TO new_user;"

# Optionally, configure PostgreSQL to allow remote connections (modify pg_hba.conf and postgresql.conf)
# sudo nano /etc/postgresql/{version}/main/pg_hba.conf
# sudo nano /etc/postgresql/{version}/main/postgresql.conf
# Replace {version} with your PostgreSQL version (e.g., 13)

# Restart PostgreSQL to apply any configuration changes
# sudo systemctl restart postgresql

echo "PostgreSQL installation complete!"

