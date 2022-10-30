# ask user to enter url
echo "Enter the git repository url"
read url

# clone url
git ls-remote $url > /dev/null 2>&1
# check if clone was successful
if [ $? -eq 0 ]; then
    echo "You have access to the remote repository"
    echo "Nice, You are good to go"
    exit 0
else
    echo "You do NOT have access to the remote repository"
fi

# ask if user to confirm
echo
echo "If a new key is generated the public key used on intra should be updated."
echo "Are you sure you want to generate a new key? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    # generate new key
    ssh-keygen > /dev/null
else
    echo "No new key generated."
fi

# display public key
echo
echo "the key is located at ~/.ssh/id_rsa.pub"
# check if os is mac
if [ "$(uname)" == "Darwin" ]; then
    cat ~/.ssh/id_rsa.pub | pbcopy
    echo "The key has been copied to your clipboard"
else
    echo "|"
    cat ~/.ssh/id_rsa.pub
    echo "|"
    echo "Copy the key above (between '|' and '|' lines) and add it to your intra account"
fi

# ask user to confirm going to intra to paste key
echo
echo "Are you sure you want to go to intra to paste the key? (y/n)"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "If you find an existing key, delete it"
    echo "Then generate a new one, paste the public key, choose any name you want for the key and click on 'Submit'"
    # open intra
    if [ "$(uname)" == "Darwin" ]; then
        open https://profile.intra.42.fr/gitlab_users
    else
        # check if xdg-open is installed
        if [ -x "$(command -v xdg-open)" ]; then
            xdg-open https://profile.intra.42.fr/gitlab_users
        else
            echo "installing xdg-open"
            sudo apt-get install xdg-utils > /dev/null 2>&1
        fi
    fi
fi

echo "Nice, You are good to go"



