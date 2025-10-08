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
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}

# 1Password SSH Agent Setup
setup_1password_ssh() {
  if command -v op >/dev/null 2>&1; then
    if [ -z "$SSH_AUTH_SOCK" ] || [ ! -S "$SSH_AUTH_SOCK" ]; then
      export SSH_AUTH_SOCK=~/.1password/agent.sock
      if ! pgrep -f "op-ssh-sign" >/dev/null; then
        op ssh sign --help >/dev/null 2>&1 || echo "1Password SSH agent not available. Ensure 1Password CLI is configured."
      fi
    fi
  fi
}



# Initialize 1Password SSH agent on shell startup
setup_1password_ssh

