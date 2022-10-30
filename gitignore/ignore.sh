# loop through script arguments and print them
PATH="~"
for arg in "$@"
do
    # check if it is the first argument
    if [ $arg == $1 ]; then
      PATH=$arg
    else
      echo $arg >> $PATH/.gitignore
    fi
done