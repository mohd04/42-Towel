#!/bin/bash

echo "Running norminette"
norminette | grep Error
norminette > /dev/null
if [ $? -eq 1 ]; then
    echo "Norminette: Error"
    exit 1
else
    echo "Norminette: Success"
fi