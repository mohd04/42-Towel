# does .git exist?
if [ ! -d .git ]; then
    echo "Do you want to create a new synced git repository? [y/n]"
    read answer
    if [ "$answer" = "y" ]; then
        git init > /dev/null
        # check if there changes in the directory
        if [ ! -n "$(git status --porcelain)" ]; then
            echo "There are no changes in the directory"
            touch readme.me
            echo "readme.me file is created"
        fi
        git add . > /dev/null
        git commit -m "Initial commit" > /dev/null
        git branch -M main > /dev/null

        read -p "Enter the github remote repository url: " remoteUrl
        echo "Adding the remote repository for github \"origin\""
        git remote add origin $remoteUrl
        
        # enter the remote repository url
        read -p "Enter the intra remote repository url: " remoteUrl
        echo "Adding the remote repository for intra \"vogshpere\""
        git remote add vogshpere $remoteUrl

        git push --set-upstream origin main
        git push --set-upstream vogsphere main
    fi
fi

alias=false
# add pushall alias to .bashrc and .zshrc
if [ git remote | grep -q "origin" ]; then
  if [ git remote | grep -q "vogsphere" ]; then
    if [ cat ~/.bashrc | grep -q "pushall" ]; then
      echo "alias pushall='git push origin main && git push vogsphere main'" >> ~/.bashrc
      alias=true
    fi
    if [ cat ~/.zshrc | grep -q "pushall" ]; then
      echo "alias pushall='git push origin main && git push vogsphere main'" >> ~/.zshrc
      alias=true
    fi
  fi
fi
# chk if alias is added
if [ $alias = true ]; then
  echo "pushall alias is added"
  echo "Please restart your terminal to use it"
fi

## later on, git config alias.pushall will be add!!
