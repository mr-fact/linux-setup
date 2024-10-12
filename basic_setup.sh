#!/bin/bash

echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

echo "Installing basic tools: curl, wget, build-essential, software-properties-common..."
sudo apt install -y curl wget build-essential software-properties-common ca-certificates gnupg lsb-release

echo "Installing Vim..."
sudo apt install -y vim

echo "Installing Git..."
sudo apt install -y git

echo "Installing Tmux..."
sudo apt install -y tmux

echo "Installing Fish shell..."
sudo apt install -y fish

echo "Setting Fish as the default shell..."
chsh -s /usr/bin/fish

echo "Installing htop..."
sudo apt install -y htop

echo "Cleaning up unnecessary packages..."
sudo apt autoremove -y

echo "Basic setup completed!"
