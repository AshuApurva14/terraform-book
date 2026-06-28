#!/usr/bin/env bash

#============================================================
# setup_awscli.sh - Install AWS CLI via AWS repo
#============================================================

set -euo pipefail

echo "========= Starting AWS Installation ===========\n"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install


echo "\n============ Installation successfully done =========="

