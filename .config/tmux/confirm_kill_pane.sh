#!/bin/sh

# Function to check if killing the pane would kill the session
if [ "$(tmux list-panes -F '#{pane_id}' | wc -l)" -eq 1 ]; then
  tmux confirm-before -p "Kill window? (y/n): " "kill-pane"
else
  tmux kill-pane
fi
