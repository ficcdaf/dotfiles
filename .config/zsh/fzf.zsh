#!/bin/env zsh
eval "$(fzf --zsh)"

colors=""

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git .anaconda .cache .conda .cmake .dart* .git* .java .librewolf .pub-cache"
FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#933737"
export FZF_DEFAULT_OPTS="
  $FZF_DEFAULT_OPTS
  --color=fg:#a7a7a7
  --color=fg+:#d5d5d5
  --color=bg:#121212
  --color=bg+:#323232
  --color=hl:#C4693D
  --color=hl+:#E49A44
  --color=info:#a7a7a7
  --color=marker:#C4693D
  --color=prompt:#C4693D
  --color=spinner:#D87C4A
  --color=pointer:#E5A72A
  --color=header:#B14242
  --color=border:#a7a7a7
  --color=query:#d5d5d5
  --color=gutter:#121212"


export FZF_TMUX_OPTS=" -p90%,70% "

source ~/.config/zsh/fzf-zsh-completion.sh

# press ctrl-r to repeat completion *without* accepting i.e. reload the completion
# press right to accept the completion and retrigger it
# press alt-enter to accept the completion and run it
keys=(
    ctrl-r:'repeat-fzf-completion'
    right:accept:'repeat-fzf-completion'
    alt-enter:accept:'zle accept-line'
)

zstyle ':completion:*' fzf-completion-keybindings "${keys[@]}"
# also accept and retrigger completion when pressing / when completing cd
zstyle ':completion::*:cd:*' fzf-completion-keybindings "${keys[@]}" /:accept:'repeat-fzf-completion'

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
source ~/.config/zsh/fzf-git.sh

alias fman="compgen -c | fzf | xargs man"
alias nzo="~/.config/zsh/zoxide-nvim.sh"
