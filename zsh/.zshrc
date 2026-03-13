export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"

zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

alias clanker="claude --dangerously-skip-permissions"

open() {
  command open "$@"
}
export PATH="$HOME/.local/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"
