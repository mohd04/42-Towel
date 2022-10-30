#!/bin/bash
shell_f=$(echo -n "$SHELL" | awk -F / '{print $3}')
shell_f="${HOME}/.${shell_f}rc"

# if ! -f "~/.Towel"; then
#     mkdir ~/.Towel
# fi

if ! grep "alias towel='make -C ~/.Towel PATH=$PWD'" <"$shell_f" &>/dev/null; then
	echo -e "\nalias towel='make -C ~/.Towel PATH=$PWD'" >>"$shell_f"
fi

echo -e "run $ source .zshrc"
