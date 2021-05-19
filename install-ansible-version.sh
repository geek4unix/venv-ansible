#!/bin/bash
VER=$1
if [[ -z $VER ]] || ! [[ $VER =~ ^[0-9] ]]; then
echo "Use $0 ARGUMENT e.g. $0 2.10.6"
exit
fi
cd
sudo yum -y install python-virtualenv
mkdir venv
virtualenv venv/ansible-$VER
cd venv/ansible-$VER/bin/
source ./activate
pip install --upgrade pip setuptools
pip install ansible==$VER
ansible --version
