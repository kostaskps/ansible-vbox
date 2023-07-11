#!/bin/bash

# https://cloudbytes.dev/snippets/upgrade-python-to-latest-version-on-ubuntu-linux


# Add the repository of Python Packages
echo "[TASK 1] Add Python repository"
sudo add-apt-repository ppa:deadsnakes/ppa

# Update package list and install packages
echo "[TASK 2] Install required packages"
apt update && apt install -y python3.11

# Add Python3 alternatives
echo "[TASK 3] Add Python3.8 and Python3.11 to update-alternatives"
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 2

# Update Python3 to point to Python3.11
echo "[TASK 4] Set Python3.11 as Default version"
echo -ne '\n' | sudo update-alternatives --config python3

echo .
echo "[TASK 5] Install Python3.11 utilities"
apt install -y python3.11-distutils python3.11-venv python3-testresources

# Install pip3
echo "[TASK 6] Install pip3"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.11 get-pip.py

# Install Ansible 2.14
echo "[TASK 7] Install Python requirements.txt"
pip3 install -r requirements-2.14.txt

# Update hosts file
echo "[TASK 8] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.18.18.100   kmaster1
172.18.18.101   kworker1
172.18.18.102   kworker2
EOF
