#!/bin/bash

check_awscli() {
    if command -v aws ; then
        echo "AWS CLI is already installed."
        return 0
    fi
    return 1
}

install_awscli() {
    echo "Installing AWS CLI on Linux..."

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    echo "Installed, verifying..."

    if aws --version ;
    then
        echo "AWS CLI Successfully Installed."
    else
            echo "Failed to install AWS CLI."
    fi
}

if ! check_awscli; then
        install_awscli
fi