#!/bin/bash

DB_NAME="informatica"
DB_USER="informatica"
DB_PASS="12345678"

psql -U postgres -c "DROP DATABASE IF EXISTS $DB_NAME;"
psql -U postgres -c "DROP USER IF EXISTS $DB_USER;"

psql -U postgres -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASS' SUPERUSER;"
psql -U postgres -c "CREATE DATABASE $DB_NAME;"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

psql -U postgres $DB_NAME < ./dataBase/dataBase.sql
