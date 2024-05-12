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
    apt install -y sudo
}

add_user() {
    echo -e "${GREEN}Adding user${CLEAR}"
    adduser $USER
    echo "$USER:$PASSWORD" | chpasswd
    echo -e "${GREEN}Adding user to sudo${CLEAR}"
    usermod -aG sudo $USER
    #chmod 0644 /etc/shadow
    echo -e "${GREEN}Installing Docker${CLEAR}"
    sudo -u mike curl -sSL https://get.docker.com | sh
    echo -e "${GREEN}Adding user to Docker${CLEAR}"
    usermod -aG docker $USER
}

install_docker() {
    echo -e "${GREEN}Installing Docker${CLEAR}"
    sudo -u mike curl -sSL https://get.docker.com | sh
    echo -e "${GREEN}WTF?{CLEAR}"
    usermod -aG docker $USER
}

create_folder() {
    echo -e "${GREEN}Would you like to create a new folder in /mnt/docker/? (y/n)${CLEAR}"
    read -r answer
    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        echo -e "${GREEN}Enter the folder name:${CLEAR}"
        read -r folder_name
        mkdir -p "/mnt/docker/$folder_name"
        chmod -R 777 "/mnt/docker/$folder_name"
        echo -e "${GREEN}Folder created: /mnt/docker/$folder_name${CLEAR}"
    else
        echo -e "${GREEN}Skipping folder creation.${CLEAR}"
    fi
}


check_root
update_system
add_user
install_docker
create_folder