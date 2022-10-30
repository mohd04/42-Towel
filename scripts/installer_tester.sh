#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
GRAY='\033[0;37m'
NC='\033[0m'

echo -e "${GREEN}This is a simple Project tester\n${NC}"
echo -e "${GREEN}(1)libft(2)Ft_Printf\n${NC}"
read answer1
clear
if [ "$answer1" == "1" ]; then
    echo -e "${GREEN}There is 2 testers for libft\n${NC}"
    echo -e "${GREEN}(1)War-Machine(2)Tripouille-libftTester\n${NC}"
    read answer2
    if [ "$answer2" == "1" ]; then
        clear
        echo -e "${GREEN}cloned inside repository!\n${NC}"
        sleep 1
        git clone https://github.com/0x050f/libft-war-machine.git
        CONF=${PWD}/libft-war-machine/my_config.sh
        if  [ ! -f "$CONF"]; then 
            bash ./libft-war-machine/grademe.sh
            bash ./libft-war-machine/my_config.sh
        fi
        clear
        echo -e "
        enter for default
        -m	When compiling library, test all the Makefile's rules (instead of doing only make re and checking if other rules exist).
        -op1	Do only part 1 tests
        -op2	Do only part 2 tests
        -ob	Do only bonus part tests
        -oa	Do only additional part tests
        ft_function	Test only this function"
        read answer3
        bash ./libft-war-machine/grademe.sh $answer3
    elif [ "$answer2" == "2" ]; then
        echo -e "${GREEN}cloned inside repository\n${NC}"
        sleep 1
        git clone https://github.com/Tripouille/libftTester.git
        clear
        echo -e "
        enter for default
        m = launch mandatory tests
        b = launch bonus tests
        a = launch mandatory tests + bonus tests
        [function name] = launch associated test ex: make calloc"
        read answer4
        make -C ./libftTester $answer4
    fi

elif [ "$answer1" == "2" ]; then
    echo -e "${GREEN}There is 2 testers for ft_printf\n${NC}"
    echo -e "${GREEN}(1)Printf Tester(2)Ft Printf Tester\n${NC}"
    read answer5
    if [ "$answer5" == "1" ]; then
        clear
        echo -e "${GREEN}cloned inside repository!\n${NC}"
        sleep 1
        git clone https://github.com/Tripouille/printfTester.git
        clear
        echo -e "
        enter for default
        m = launch mandatory tests
        b = launch bonus tests
        a = launch mandatory tests + bonus tests
        [category] = launch associated category ex: s"
        read answer6
        make -C ./printfTester $answer6
    elif [ "$answer5" == "2" ]; then
        echo -e "${GREEN}cloned inside repository\n${NC}"
        sleep 1
        git clone https://github.com/paulo-santana/ft_printf_tester.git
        clear
        echo -e "
        (enter): run all the tests
        m: run all the mandatory tests
        b1: run the first bonus tests ('-0.' and widths)
        b2: run the second bonus tests ('# +')
        ?: run only the mandatory tests related to the specifier.
        ^Currently, only the cspdiuxX% specifiers are supported"
        read answer7
        cd ${PWD}/ft_printf_tester
        sh test $answer7
    fi
fi
exit