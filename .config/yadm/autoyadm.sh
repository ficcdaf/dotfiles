#!/bin/bash

# This script reads tracked paths
# from a file and executes "yadm add"
# on all of them, then creates a timestamped
# commit and pushes the changes.

AYE="AutoYADM Error:"
AYM="AutoYADM:"

# First we read each path from "tracked"
while read -r path; do
  # Execute yadm add on each real file
  # if the path points to a directory
  # This ensures symlinks are not added
  if [ -d "$path" ]; then
    find "$path" -type f -exec yadm add {} +
  # If just a file, we add directly
  elif [ -f "$path" ]; then
    yadm add "$path"
  # If neither file nor dir, something is very wrong!
  else
    echo "$AYE Target must be a directory or a file!"
    exit 1
  fi
done <"$HOME/.config/yadm/tracked"

# Define the location of the ssh-agent environment
sshenv="$HOME/.ssh/environment-$HOST"

if [[ -n $(yadm status --porcelain) ]]; then
  yadm commit -m "AutoYADM commit: $(date +'%Y-%m-%d %H:%M:%S')"
  # Check if the ssh-agent env exists
  if [ -f "$sshenv" ]; then
    # Directive to suppress shellcheck warning
    # shellcheck source=/dev/null
    source "$sshenv"
    yadm push
  else
    echo "$AYE ssh-agent environment not found, aborting push..."
    exit 1
  fi
fi

echo "$AYM Push successful!"
