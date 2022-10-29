#!/usr/bin/bash

if [ -n "$($SHELL -c 'echo $ZSH_VERSION')" ]; then
    rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
    exit
elif [ -n "$($SHELL -c 'echo $BASH_VERSION')" ]; then
    rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> ~/.bashrc && source ~/.bashrc && brew update
    exit
else
    echo "use bash or zsh"
fi