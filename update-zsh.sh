#!/bin/sh

cd ~/.oh-my-zsh
git checkout -b my-custom
git add .
git commit -m "fix mackup"
git checkout master
omz update
git merge my-custom
git branch -d my-custom
