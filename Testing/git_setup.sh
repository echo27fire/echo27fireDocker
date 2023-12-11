#!/bin/bash

# Prompt for username
read -p "Enter your username: " username

# Prompt for git token
read -s -p "Enter your git token: " git_token
echo

# Set git configuration
git config --global user.name "$username"
git config --global user.email "$username@example.com"
git config --global credential.helper store
git config --global credential.helper 'cache --timeout=3600'

# Clone the repository
git clone https://github.com/your-repo.git

# Change directory to the repository
cd your-repo

# Set remote origin URL with git token
git remote set-url origin "https://$username:$git_token@github.com/your-repo.git"

# Push changes to the repository
git push origin master

echo "Repository setup complete!"
