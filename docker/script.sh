#!/bin/sh
set -e

VERSION=1.0

GREEN='\033[1;32m'
RED='\033[1;31m'
CLEAR='\033[0m'

USER='mike'
PASSWORD='Samaki142646'

check_root() {
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${RED}Must run as root${CLEAR}"
    echo -e "This script must be run as root" 
    exit 1
fi
}

update_system() {
    echo -e "${GREEN}Updating system${CLEAR}"
    apt -y update
    apt -y upgrade
    echo -e "${GREEN}Installing needed packages${CLEAR}"
    apt install -y sudo curl
}

add_user() {
    echo -e "${GREEN}Adding user${CLEAR}"
    adduser $USER
    echo -e "${GREEN}Adding user to sudo${CLEAR}"
    usermod -aG sudo mike
    chmod 0644 /etc/shadow
    #passwd $USER
    echo $USER:$PASSWORD | chpasswd
}

install_docker() {
    echo -e "${GREEN}Login${CLEAR}"
    su $USER
    echo -e "${GREEN}Installing Docker${CLEAR}"
    curl -sSL https://get.docker.com | sh
}

check_root
update_system
add_user
install_docker