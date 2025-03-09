#!/bin/bash

echo "Going to the home folder"
cd ~

echo "Cloning the repository"
git clone https://github.com/AbhayGRT/Deployment.git

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