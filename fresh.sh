#!/bin/bash

# Bootstrap installs things

function bootstrapTerminal() {
    sudo -v #ask for password beforehand
    source ~/.dotfiles/installscript
}

echo 'Bootstrap Terminal'
echo '------------------'
echo 'This will reset your terminal. Are you sure you want to do this? (y/n) '
read -p 'Answer: '  reply

if [[ $reply =~ ^[Yy]$ ]]
then
   bootstrapTerminal
fi