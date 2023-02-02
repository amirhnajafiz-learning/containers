#!/usr/bin/bash

# In this file, all the operations for creating a git repository will be executed

# Getting the repo url and the branch name
repourl="$1"
branchname="$2"

# Initialize
git init
git clone "$repourl"

# Creating the gitignore file
echo "git_set.sh" > .gitignore

# Add a remote
git remote add origin "$repourl"

# Add files
git add .
git commit -m "Startup"

# Add files to base
git push -u origin master

# Create a pull request
xdotool key "control+x"
git pull --allow-unrelated-histories "$repourl"

# Add a new branch
git checkout -b "$branchname"

# Create a config file
echo "$repourl" > config
echo "$branchname" >> config

# Adding files to new branch
git add .
git commit -m "Start branch"

# Sending the config file into repo
git push -u origin "$branchname"

git checkout master
