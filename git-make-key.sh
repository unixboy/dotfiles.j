#!/bin/bash
if [ $# -gt 0 ]; then
    echo "No arguements should be provided"
    exit 1
else
    echo "Github keygenerator by Palli Moon"
    echo "Enter email: "
    read email
    echo "Enter Github user name: "
    read username
fi
echo "Creating github ssh key for \"$email\"..."
ssh-keygen -t rsa -f ~/.ssh/id_rsa -b 4096 -C "$email"
echo "Adding ssh key to ssh agent..."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
echo "Setting git config email to \"$email\"..."
git config --global user.email "$email"
echo "Setting git config username to \"$username\"..."
git config --global user.name "$username"
echo "Copy this key to github:"
echo ""
cat ~/.ssh/id_rsa.pub


