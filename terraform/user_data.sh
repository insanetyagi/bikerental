#!/bin/bash
# Install Docker & Docker Compose (if not in AMI)
apt-get update
apt-get install -y docker.io docker-compose git

# Clone your repo
cd /home/ubuntu
git clone https://github.com/insanetyagi/bikerental.git

# Run docker-compose
cd bikerental
docker-compose up -d
