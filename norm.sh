#!/bin/bash

norminette
if echo $?
then
    echo "Failure: norm error"
else
    echo "Success! No norm errors"
fi