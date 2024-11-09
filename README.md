# Ubuntu Server Setup Scripts

This repository contains multiple shell scripts to help you quickly set up a new Ubuntu server with essential tools, security configurations, Python/Django environment, and Docker images.

## Table of Contents
- [Introduction](#introduction)
- [Basic Setup](#basic-setup)
- [Security Setup](#security-setup)
- [Python and Django Setup](#python-and-django-setup)
- [Docker Setup](#docker-setup)
- [How to Use](#how-to-use)
- [Command Assistance](#command-assistance)

## Introduction

These scripts are designed to automate the initial setup of a new Ubuntu server by installing necessary packages and performing essential configurations. Each script focuses on a specific aspect of server setup:
1. **Basic Setup** – Installs commonly used utilities.
2. **Security Setup** – Configures basic security settings (SSH, firewall, Fail2Ban, etc.).
3. **Python and Django Setup** – Installs Python, PostgreSQL, and sets up an environment for Django applications.
4. **Docker Setup** – Installs Docker and lets you choose which popular Docker images to download.

## Basic Setup

The `basic_setup.sh` script installs a set of essential tools and utilities that are commonly needed on a fresh Ubuntu server.

### Installed Tools:
- `curl`, `wget`, `build-essential`, `software-properties-common`
- `vim` (text editor)
- `git` (version control)
- `tmux` (terminal multiplexer)
- `fish` (user-friendly shell)
- `htop` (system monitor)

To run this script:

```bash
chmod +x basic_setup.sh
./basic_setup.sh
```

## Security Setup

The `security_setup.sh` script focuses on configuring security-related settings for the server. It does the following:
- Creates a new non-root user with sudo privileges.
- Configures SSH for key-based authentication and disables password login.
- Installs and configures UFW (firewall) and Fail2Ban to protect against brute-force attacks.

To run this script:

```bash
chmod +x security_setup.sh
./security_setup.sh
```

## Python and Django Setup

The `python_django_setup.sh` script installs the necessary packages and dependencies for running Python and Django applications on your server. It installs:
- Python 3, pip, and virtualenv.
- PostgreSQL database and libraries required for connecting Django to PostgreSQL.
- Nginx and Gunicorn for serving Django applications.

To run this script:

```bash
chmod +x python_django_setup.sh
./python_django_setup.sh
```

## Docker Setup

The `docker_setup.sh` script installs Docker, Docker Compose, and allows you to pull popular Docker images based on your needs. After installation, you can choose from a set of common Docker images to download.

### Available Docker Images:
- PostgreSQL
- MongoDB
- MySQL
- Redis
- Nginx
- Python
- Node.js

To run this script:

```bash
chmod +x docker_setup.sh
./docker_setup.sh
```

Once the script asks, simply input the names of the images you'd like to pull, separated by spaces. For example:

```
Options: postgres mongo redis nginx
```

## How to Use

1. Clone this repository to your Ubuntu server:

```bash
git clone https://github.com/mr-fact/linux-setup.git
cd linux-setup
```

2. Make sure the scripts are executable:

```bash
chmod +x *.sh
```

3. Run the scripts in the order you need, depending on your setup requirements. For example, to start with the basic setup:

```bash
./basic_setup.sh
```

4. Follow the instructions provided by each script. You may need to input some data (like a username) or make configuration choices along the way.

## Contributions

Feel free to fork this repository and make improvements or add additional setup scripts. Pull requests are welcome!

## command assistance
### nginx
```bash
# Create a New Server Block
sudo nano /etc/nginx/sites-available/example.com

# Create the Document Root
sudo mkdir -p /var/www/example.com/
sudo chown -R $USER:$USER /var/www/example.com/

# Enable the Server Block
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/

# Test and Reload Nginx
sudo nginx -t
sudo systemctl reload nginx
```
### Setting up SSL for Nginx
```bash
# Install Certbot
sudo apt update
sudo apt install certbot python3-certbot-nginx

# Obtain an SSL Certificate
sudo certbot --nginx -d example.com -d www.example.com

# Set Up Automatic Renewal
sudo certbot renew --dry-run

# Check Nginx Configuration
sudo nano /etc/nginx/sites-available/example.com
# server {
#     listen 80;
#     server_name example.com www.example.com;
#     return 301 https://$host$request_uri;
# }
# server {
#     listen 443 ssl;
#     server_name example.com www.example.com;
# 
#     ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
#     ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
#
#     ...
# }
```
