#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Python3 and pip..."
sudo apt install -y python3 python3-pip python3-venv

echo "Installing PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib libpq-dev

echo "Installing virtualenv..."
pip3 install virtualenv

echo "Installing Python dependencies for Django..."
pip3 install django psycopg2-binary

echo "Installing Nginx and Gunicorn..."
sudo apt install -y nginx
pip3 install gunicorn

echo "Python and Django setup completed!"
