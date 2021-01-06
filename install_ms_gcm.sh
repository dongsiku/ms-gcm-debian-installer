#!/bin/bash

# Get INSTALL_SH_DIRNAME
INSTALL_SH_FILENAME=`readlink -f $0`
INSTALL_SH_DIRNAME=`dirname $INSTALL_SH_FILENAME`
GITCONFIG_FILENAME="${INSTALL_SH_DIRNAME}/settings/git.cfg"

# Install required applications via apt
sudo apt update
sudo apt install -y wget openjdk-11-jre git

# Install bash-completion for Git on WSL-Debian
sudo apt install -y bash-completion

# Read setting setting file
if [ -f $GITCONFIG_FILENAME ]; then
    . $GITCONFIG_FILENAME
else
    echo "If you want to set up .gitconfig, create settings/git.cfg"
    # cp "${GITCONFIG_FILENAME}.org" $GITCONFIG_FILENAME
    echo -e "Are you sure you want to continue the installation? (y/n)[y]"
    read answer

    case $answer in
        n)
            echo "Edit settings/git.cfg"
            # cp "${GITCONFIG_FILENAME}.org" $GITCONFIG_FILENAME
            exit 1
            ;;
        *)
            echo "Continue ..."
            ;;
    esac
fi

# Set up .gitconfig
if [ -f $GITCONFIG_FILENAME ]; then
    git config --global user.name "$user_name"
    git config --global user.username "$user_username"
    git config --global user.email "$user_email"
    git config --global color.ui auto
fi

# Create the target directory to install MS-GCM
INSTALLATION_DIRNAME="$HOME/git-credential-manager-2.0.4/"
mkdir -p $INSTALLATION_DIRNAME

# Download and install MS-GCM
MS_GCM_DOWNLOAAD_LINK="https://github.com/microsoft/Git-Credential-Manager-for-Mac-and-Linux/releases/download/git-credential-manager-2.0.4/git-credential-manager-2.0.4.jar"
if [ ! -f $INSTALLATION_DIRNAME/git-credential-manager-2.0.4.jar ]; then
    wget $MS_GCM_DOWNLOAAD_LINK -P $INSTALLATION_DIRNAME
fi
java -jar $INSTALLATION_DIRNAME/git-credential-manager-2.0.4.jar install
git config --global credential.canFallBackToInsecureStore true
