#!/bin/bash

# ایجاد کاربر جدید و افزودن به گروه sudo
echo "Creating a new non-root user..."
read -p "Enter new username: " NEW_USER
sudo adduser $NEW_USER
sudo usermod -aG sudo $NEW_USER

# تنظیم احراز هویت مبتنی بر کلید SSH و غیرفعال کردن ورود با پسورد
echo "Configuring SSH for key-based authentication..."
ssh-copy-id $NEW_USER@remote_server_ip

# غیرفعال‌سازی ورود با پسورد و ورود کاربر ریشه
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# راه‌اندازی مجدد سرویس SSH
sudo systemctl restart ssh

# نصب و پیکربندی UFW (فایروال)
echo "Installing and configuring UFW..."
sudo apt install -y ufw
sudo ufw allow OpenSSH
sudo ufw allow 80
sudo ufw allow 443
sudo ufw --force enable

# نصب و پیکربندی Fail2Ban برای جلوگیری از حملات brute-force
echo "Installing Fail2Ban..."
sudo apt install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "Security setup completed!"
