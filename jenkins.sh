#!/bin/bash

# Update the package list
sudo apt update

# Install the OpenJDK 17 JRE
sudo apt install openjdk-17-jre

# Check the Java version
java -version

# Download the Jenkins signing key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package list again
sudo apt update

# Install Jenkins
sudo apt-get install jenkins
