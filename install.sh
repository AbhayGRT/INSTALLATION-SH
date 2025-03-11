#!/bin/bash

# Some of the applications maybe there I am just sure that it didn't create any error
sudo apt update
sudo apt install gnome-terminal jq lsof xdg-utils python3 python3-pip python3-venv coreutils gnome-settings-daemon findutils

echo "Going to the home folder"
cd ~

echo "Cloning the repository"
git clone https://github.com/AbhayGRT/Deployment.git

sudo chmod 777 -R Deployment

cd Deployment

echo "Activating Virtual Environment"
python3 -m venv deployment

if [ -d "deployment/bin" ]; then
    source deployment/bin/activate
else
    echo "Virtual environment not found!"
    exit 1
fi

echo "Installing dependencies"
pip install -r requirements.txt

echo "Starting the application...."
python3 login.py
bash cloud.sh
bash wnb.sh
