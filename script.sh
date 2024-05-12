#!/bin/sh -e

VERSION=1.0

GREEN='\033[1;32m'
RED='\033[1;31m'
CLEAR='\033[0m'

USER='mike'

check_root() {
if [ "$(id -u)" -ne 0 ]; then
    echo "${RED}Must run as root${CLEAR}"
    echo "This script must be run as root" 
    exit 1
fi
}

update_system() {
    echo "${GREEN}Updating system${CLEAR}"
    apt update
    apt upgrade
    echo "${GREEN}Installing needed packages${CLEAR}"
    apt install sudo curl
}

add_user() {
    echo "${GREEN}Adding user${CLEAR}"
    adduser $USER
    echo "${GREEN}Adding user to sudo${CLEAR}"
    usermod -aG sudo mike
}

install_docker() {
    echo "${GREEN}Login${CLEAR}"
    su $USER
    echo "${GREEN}Installing Docker${CLEAR}"
    curl -sSL https://get.docker.com | sh
}

check_root
update_system
add_user
install_docker