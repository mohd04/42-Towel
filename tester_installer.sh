#!/usr/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
GRAY='\033[0;37m'
NC='\033[0m'

echo -e "${GREEN}This is a simple installation to download Container\n${NC}"
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
        sleep 3
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

elif ["$answer1" == "2"]; then
    echo -e "${GREEN}There is 2 testers for ft_printf\n${NC}"
    echo -e "${GREEN}(1)War-Machine(2)Tripouille-libftTester\n${NC}"
    read answer5
    if [ "$answer6" == "1" ]; then
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
        read answer7
        make -C ./printfTester $answer7
    elif [ "$answer6" == "2" ]; then
        echo -e "${GREEN}cloned inside repository\n${NC}"
        sleep 3
        git clone https://github.com/paulo-santana/ft_printf_tester.git
        clear
        echo -e "
        sh test: run all the tests
        sh test m: run all the mandatory tests
        sh test b1: run the first bonus tests ('-0.' and widths)
        sh test b2: run the second bonus tests ('# +')
        sh test ?: run only the mandatory tests related to the specifier.
        ^Currently, only the cspdiuxX% specifiers are supported"
        read answer8
        bash ./ft_printf_tester/test $answer8
    fi
fi
exit