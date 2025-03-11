#!/bin/bash

# Update package lists and install required dependencies
sudo apt update
sudo apt install -y gnome-terminal jq lsof xdg-utils python3 python3-pip python3-venv coreutils gnome-settings-daemon findutils

echo "Going to the home folder"
cd ~

echo "Cloning the repository"
git clone https://github.com/AbhayGRT/Deployment.git

sudo chmod -R 777 Deployment

cd Deployment

echo "Activating Virtual Environment"
python3 -m venv deployment

if [ -d "deployment/bin" ]; then
    source deployment/bin/activate
else
    echo "Virtual environment not found!"
    exit 1
fi

echo "Upgrading pip"
pip install --upgrade pip

echo "Installing dependencies"
pip install --no-cache-dir -r requirements.txt

echo "Setting execution permissions for scripts"
chmod +x login.sh cloud.sh wnb.sh

echo "Starting the application...."
bash ./login.sh
bash ./cloud.sh
bash ./wnb.sh
