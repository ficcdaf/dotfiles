if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
fish_ssh_agent
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/isa/.ghcup/bin # ghcup-env
