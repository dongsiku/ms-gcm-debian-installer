#!/bin/bash

# Install required applications via apt
sudo apt update
sudo apt install -y wget openjdk-11-jre

# Install bash-completion for Git on WSL-Debian
sudo apt install -y bash-completion

# Create the target directory to install MS-GCM
INSTALLATION_DIRNAME="$HOME/git-credential-manager-2.0.4/"
mkdir -p $INSTALLATION_DIRNAME

# Download and install MS-GCM
MS_GCM_DOWNLOAAD_LINK="https://github.com/microsoft/Git-Credential-Manager-for-Mac-and-Linux/releases/download/git-credential-manager-2.0.4/git-credential-manager-2.0.4.jar"
wget $MS_GCM_DOWNLOAAD_LINK -P $INSTALLATION_DIRNAME
java -jar $INSTALLATION_DIRNAME/git-credential-manager-2.0.4.jar install
git config --global credential.canFallBackToInsecureStore true
