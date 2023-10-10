#!/usr/bin/env bash
# Author: Ibrahim Mkusa
# About: sets environment for a multi-machine dev
# Why: Run this in project directory to set up directory structure

set -e

usage() {
 echo "./install.sh" 
}


read -rp "Which distro are using [deb/rpm]" distro

if [[ $distro == "deb" ]]; then
  manager="apt"
elif [[ $distro == "rpm" ]]; then
  manager="dnf"
fi
  
# update machine
sudo $manager update -y || true

sudo $manager install -y vagrant virtualbox || true

# get credentials to register redhat machines
read -rp "What's your redhat username" redhat_name
read -rp "What's your redhat password" redhat_pw
export RH_NAME=$redhat_name RH_PW=$redhat_pw

# Assumes its run in root of this cloned repo
vagrant up

