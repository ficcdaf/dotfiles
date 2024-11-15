export ZSH="$HOME/.oh-my-zsh"
plugins=(ssh-agent git zsh-autosuggestions zsh-syntax-highlighting aliases colored-man-pages copybuffer copyfile copypath fancy-ctrl-z systemd z )
source $ZSH/oh-my-zsh.sh

# autoload -U promptinit; promptinit
# prompt purer
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

# Set up fzf key bindings and fuzzy completion
# eval "$(fzf --zsh)"

alias ls="eza -lh --git"
alias top=btop
alias v=nvim
alias testvim='NVIM_APPNAME=nvim-test nvim'
alias lg=lazygit
alias ylg="yadm enter lazygit"
# tmux aliases
alias tm="tmux"
# alias ta="tmux attach-session"
# alias tat="tmux attach-session -t"
# alias tka="tmux kill-session -a"
# alias tkt="tmux kill-session -t"
# alias tl="tmux list-sessions"
# alias tn="tmux new-session"
# alias tnt="tmux new-session -t"

alias zj=zellij

alias svenv="source .venv/bin/activate"
alias szsh="source ~/.zshrc"
alias vzsh="vim ~/.zshrc"
alias icat="kitty +kitten icat"
alias vn=viewnior
alias mermaid=mmdc


alias autoyadm="AUTOYADMPUSH=1 ~/dev/autoyadm/autoyadm.sh"
alias yadmadd="~/dev/autoyadm/yadmadd.sh"

bindkey -r '^T'

# Created by `pipx` on 2024-09-20 02:14:00
export PATH="$PATH:/home/fic/.local/bin"
fpath=(~/.zsh.d/ $fpath)
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
