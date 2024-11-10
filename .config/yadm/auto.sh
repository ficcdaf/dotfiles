# Add individual files, ignoring symlinks
[ ! -L "$HOME/.zshrc" ] && yadm add "$HOME/.zshrc"

# Directory navigation
cd "$HOME/.config/" || exit

# List of config directories/files to add
# TODO: add these to a text file instead and read from it for easy appending
# could add a yadm alias to append stuff to this file?
configs=(nvim btop dunst i3 kitty lazygit nushell polybar rofi tmux wal zathura starship.toml yadm)

# Loop through each item in configs array
for config in "${configs[@]}"; do
  # Check if it's not a symlink before adding
  # [ ! -L "$config" ] && [ -n "$(find "$config" -type l)" ] && yadm add "$config"
  find "$config" -type f -exec yadm add {} +
done

sshenv="$HOME/.ssh/environment-$(cat /etc/hostname)"

# Commit and push if there are changes
if [[ -n $(yadm status --porcelain) ]]; then
  yadm commit -m "Auto commit: $(date +'%Y-%m-%d %H:%M:%S')"
  # Check if the ssh-agent env is present
  if [ -f "$sshenv" ]; then
    # source "$HOME/.ssh/environment-dpad"
    source "$sshenv"
    yadm push
  else
    echo "ERROR: ssh-agent environment not found, aborting push..."
    exit
  fi
fi
