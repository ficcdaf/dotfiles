#!/bin/bash

# This script takes file or directories as
# arguments and appends them to the "tracked"
# file, for use by autoyadm.sh

YADMDIR="$HOME/.config/yadm"
AYE="AutoYADM Error:"
AYM="AutoYADM:"

# We check if any arguments have been provided
if [ $# -eq 0 ]; then
  echo "$AYE $0 <file_or_directory> [<file_or_directory> ...]"
  exit 1
fi

# We loop through arguments
for arg in "$@"; do
  # check if current arg is a real path
  if [ ! -e "$arg" ]; then
    echo "$AYE '$arg' is not a valid path."
    continue
  fi
  # get its absolute path
  abs=$(realpath "$arg")
  # check if it's inside home dir
  if [[ "$abs" == "$HOME"* ]]; then
    # convert to path relative to ~
    rel=${abs#"$HOME/"}
    # append to tracked file
    echo "$HOME/$rel" >>"$YADMDIR/tracked"
    echo "$AYM Tracking $HOME/$rel"
  else
    echo "$AYM Path must be inside the home directory."
    exit 1
  fi
done
