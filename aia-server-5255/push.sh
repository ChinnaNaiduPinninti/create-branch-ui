#!/bin/bash


# Input string
input_string="$1"
cd C:/Users/vkraft/pubsubusingkafkaandwebmrepo/aia-server-5055

# Use 'cut' to split the string by ',' and assign to variables
branchName=$(echo "$input_string" | cut -d ',' -f 1)

message=$(echo "$input_string" | cut -d ',' -f 2)
git switch $branchName

git add --all

git status

git commit -m "$message"

git push 
