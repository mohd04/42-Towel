#!/bin/bash
CURRENT_PATH="$1/"
SRCS_DIR="srcs/"
INCLUDES_DIR="includes/"

# create the directory
mkdir -p $CURRENT_PATH$INCLUDES_DIR
mkdir -p $CURRENT_PATH$SRCS_DIR
echo '#include\t<stdio.h>\n\nint\tmain(void)\n{\n\tprintf("Hello World!");\n\treturn (0);\n}' > $CURRENT_PATH$SRCS_DIR/main.c

cp "../Makefile" $CURRENT_PATH
# should be updated
