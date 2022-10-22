#!/bin/bash
echo "###################################"
echo "Running WSL Setup Script"
echo "###################################"
echo

echo "###################################"
echo "Updating Packages"
echo "###################################"
echo

sudo apt-get update && sudo apt update -y

echo "###################################"
echo "Installing Common Utilities"
echo "###################################"
echo

sudo apt-get install -y gnupg software-properties-common zip wget apt-transport-https git

echo "###################################"
echo "Installing Terraform"
echo "###################################"
echo

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

echo "###################################"
echo "Installing tflint"
echo "###################################"
echo

curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

echo "###################################"
echo "Installing az-cli"
echo "###################################"
echo

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

echo "###################################"
echo "Installing Powershell"
echo "###################################"
echo

wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell

echo "###################################"
echo "Installing Python 3.10"
echo "###################################"
echo

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.10

echo "###################################"
echo "Installing .NET Core 6 LTS"
echo "###################################"
echo

sudo apt-get install -y dotnet6

