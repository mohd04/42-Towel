#!/usr/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
GRAY='\033[0;37m'
NC='\033[0m'


echo -e "${GREEN}This is a simple installation to download Container\n${NC}"


echo -e "${GREEN}Is this you personal device or 42 IMAC${NC}"
echo -e "${GREEN}(1)42 IMAC (2)Personal device ${NC}"
echo -e "${GREEN}(exit)to do nothing${NC}"
read answer1

if [ "$answer1" = "exit" ]; then
    exit
fi

if [ "$answer1" = "1" ]; then 
    git clone https://github.com/opsec-infosec/42-ValgrindContainer.git
    cd 42-ValgrindContainer
    ./install
    exit
fi

if [ "$answer1" = "2" ]; then
    git clone https://github.com/opsec-infosec/42-Devcontainer.git
    exit
fi
echo -e "${RED}Wrong input${NC}"
exit
