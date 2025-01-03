# bindkey -r '^S'
bindkey -r '\ex'
ZSH="$HOME/.oh-my-zsh"
plugins=(ssh-agent git github zsh-autosuggestions zsh-syntax-highlighting aliases colored-man-pages copybuffer copyfile copypath fancy-ctrl-z systemd )
source ~/.profile
source $ZSH/oh-my-zsh.sh

# Note: if I do get Obsidian Bridge working, this is
# a really bad way to load the env because 
# it slows down shell initialization significantly.
# Would be better to find a way to have the plugin 
# call this script dynamically instead!
# source ~/scripts/obsidian-bridge.sh

# autoload -U promptinit; promptinit
# prompt purer
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

# autoload -Uz compinit
# compinit

# Set up fzf key bindings and fuzzy completion
source ~/.config/zsh/fzf.zsh
# Not working for some reason...
# source ~/.config/zsh/fzf-git.sh

alias gitfetch="onefetch"

# alias ls="eza -lh --git"
# alias ls="eza --long --color=always --git --header --icons --no-user"
alias c="clear"
alias top=btop
alias minvim='NVIM_APPNAME="nvim-min" nvim'
alias vimclean='nvim --clean'
alias catkeys='/bin/cat -v'
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias vm='nvim --clean'
alias mktdir='cd $(mktemp -d)'
alias n='nvim'
alias lg=lazygit
alias ylg="yadm enter lazygit"
# tmux aliases
alias tmuxclean="tmux -L test -f /dev/null"
alias tm="tmux"
alias ta="tmux attach-session"
alias tat="tmux attach-session -t"
alias tka="tmux kill-session -a"
alias tkt="tmux kill-session -t"
alias tl="tmux list-sessions"
alias tn="tmux new-session"
alias tnt="tmux new-session -t"

# alias zj=zellij
# alias yeet="yay -Rns"

alias svenv="source .venv/bin/activate"
alias szsh="source ~/.zshrc"
alias vzsh="vim ~/.zshrc"
alias vtmux="vim ~/.config/tmux/tmux.conf"
alias icat="kitty +kitten icat"
alias iecho="xclip -selection clipboard -t image/png -o >"
alias vn=viewnior
alias mermaid=mmdc
alias dnd=dragon-drop
alias cat=bat


alias autoyadm="AUTOYADMPUSH=1 ~/dev/autoyadm/autoyadm.sh"
alias yadmadd="~/dev/autoyadm/yadmadd.sh"


# Created by `pipx` on 2024-09-20 02:14:00
export PATH="$PATH:/home/fic/.local/bin:/home/fic/.cargo/bin:/home/fic/go/bin"
fpath=(~/.zsh.d/ $fpath)
unalias ls
function ls() {
  eza --long --color=always --git --header --icons "$@"
}
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
# . /opt/asdf-vm/asdf.sh
# Need this to fix the cursor in tmux
print -n '\033[5 q'
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
export DIRENV_LOG_FORMAT=""
export GPG_TTY=$(tty)
eval "$(direnv hook zsh)"
# colorscript -e 36
source ~/scripts/obsidian-bridge.sh
