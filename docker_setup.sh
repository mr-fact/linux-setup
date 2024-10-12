#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

sudo systemctl start docker
sudo systemctl enable docker

echo "Installing Docker Compose..."
sudo apt install -y docker-compose

echo "Which Docker images would you like to install? (separate with space)"
read -p "Options: postgres mongo mysql redis nginx python node: " images

for image in $images; do
  echo "Pulling Docker image: $image..."
  docker pull $image
done

echo "Docker setup and image pull completed!"
