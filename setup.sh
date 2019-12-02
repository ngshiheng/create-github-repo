#!/bin/bash

# Run this is you're setting up for the first time:
# echo "source ~/.git-jidoka-script.sh" >> ~/.bashrc

# "🕊 Copy & source '.git-jidoka-script' from home directory"
cp .git-jidoka-script.sh ~/ && source ~/.git-jidoka-script.sh
echo "🥳 Finished setup."
echo "HINT: run 'git-create-project' to create a new repository on GitHub"
