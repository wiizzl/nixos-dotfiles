#!/usr/bin/env bash

init() {
    CURRENT_USERNAME='pier'
    NORMAL=$(tput sgr0)
    WHITE=$(tput setaf 7)
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    BRIGHT=$(tput bold)
    UNDERLINE=$(tput smul)
}

confirm() {
    echo -en "[${GREEN}y${NORMAL}/${RED}n${NORMAL}]: "
    read -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
}

get_host() {
    echo -en "Choose a ${GREEN}host${NORMAL} - [${YELLOW}D${NORMAL}]esktop or [${YELLOW}L${NORMAL}]aptop: "
    read -n 1 -r
    echo

    if [[ $REPLY =~ ^[Dd]$ ]]; then
        HOST='desktop'
    elif [[ $REPLY =~ ^[Ll]$ ]]; then
        HOST='laptop'
    else
        echo "Invalid choice. Please select 'D' for desktop or 'L' for laptop."
        exit 1
    fi

    echo -en "$NORMAL"
    echo -en "Use the$YELLOW "$HOST"$NORMAL ${GREEN}host${NORMAL} ? "
    confirm
}

build() {
    echo -e "\n${RED}START INSTALL PHASE${NORMAL}\n"

    echo -e "Copying ${MAGENTA}/etc/nixos/hardware-configuration.nix${NORMAL} to ${MAGENTA}./hosts/${HOST}/${NORMAL}\n"
    cp /etc/nixos/hardware-configuration.nix hosts/${HOST}/hardware-configuration.nix

    echo -e "Creating ${MAGENTA}system ${NORMAL}folders"
    mkdir -p ~/Documents
    mkdir -p ~/Videos
    mkdir -p ~/Pictures
    mkdir -p ~/Downloads
    mkdir -p ~/Desktop
    mkdir -p ~/Musics
    mkdir -p ~/Public
    mkdir -p ~/Templates

    echo -en "You are about to start the system build, do you want to process ? "
    confirm

    echo -e "\nBuilding the system...\n"
    sudo nixos-rebuild switch --flake .
}

main() {
    init
    get_host
    build
}

main && exit 0
