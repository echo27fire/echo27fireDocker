#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Verify installation
ansible --version

# Configure Ansible
# BEGIN: Ansible Configuration
# Add your Ansible configuration here
# END: Ansible Configuration

# Add hosts to inventory
# BEGIN: Inventory Configuration
# Add your inventory configuration here
# END: Inventory Configuration

# Test Ansible connectivity
ansible all -m ping
