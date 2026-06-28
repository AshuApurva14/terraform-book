#!/usr/bin/env bash
# ==============================================================
# install_terraform.sh — Installs Terraform via HashiCorp repo
# Usage: sudo bash install_terraform.sh
# ==============================================================

set -euo pipefail

echo "======================= Install gpg =================="

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

echo "================ GPG Key extraction ========"

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo  "==============================================================================================\n"

echo "=========== Verify GPG key ============\n"

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo  "==================================================================================================\n"

echo "==========================Add official repository ======================================"

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "===============================================================================================================================================================\n"


echo "================================ Update system and Install terraform ==================================\n"

sudo apt update

sudo apt-get install terraform

echo "========================================================================================================\n"

echo "======= Enable Autocompletion ========================"

if [ -f ~/.bashrc ]; then
   echo -e "File exists\n "
else
   echo -e "Creating the ~/.bashrc file\n"
   touch ~/.bashrc
fi 

terraform -install-autocomplete
