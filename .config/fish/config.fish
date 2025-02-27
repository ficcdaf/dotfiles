if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
set -x PATH $HOME/.local/bin $PATH
# set -Ux TERM xterm-256color
# set -gx TERM xterm-256color
