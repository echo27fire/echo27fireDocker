#!/bin/bash

# Install dependencies
sudo yum update
sudo yum install -y epel-release
sudo yum install -y ansible

# Verify installation
ansible --version

# Configure Ansible
# Add your Ansible configuration here

# Add hosts to inventory
# Add your inventory configuration here

# Test Ansible connectivity
ansible all -m ping
