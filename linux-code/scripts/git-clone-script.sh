#!/bin/bash
# Get the git clone command from the argument
command="$1"
# Define the directory where you want to clone the Git repository
clone_directory="/opt/wm/git"
# Change to the clone directory
cd "$clone_directory" || exit 1
# Execute the git clone command
eval "$command"