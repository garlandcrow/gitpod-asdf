#! /bin/bash
tools=$(cat .tool-versions | cut -d\  -f 1)
for tool in $tools
do
  echo "Installing $tool"
  asdf plugin add $tool
done