#!/usr/bin/bash

git clone https://github.com/ombhd/Cleaner_42.git

./Cleaner_42/CleanerInstaller.sh

shell_f=$(echo -n "$SHELL" | awk -F / '{print $3}')

shell_f="${HOME}/.${shell_f}rc"

if ! grep "alias cclean='bash ${PWD}/Cleaner_42/CCleaner_42.sh'" <"$shell_f" &>/dev/null; then
	echo -e "\nalias cclean='bash ${PWD}/Cleaner_42/Cleaner_42.sh'" >>"$shell_f"
fi

source $shell_f
