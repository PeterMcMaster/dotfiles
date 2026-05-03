if [[ "$OSTYPE" == "linux-gnu"* && "$TERM" == "xterm-ghostty" ]]; then
  export TERM=xterm-256color
fi

# Vim-like mode and faster ESC handling for interactive shells.
if [[ $- == *i* ]]; then
  export KEYTIMEOUT=1
  bindkey -v
fi

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Convenience
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'

alias tm='tmux'
alias ta='tmux attach -t'
alias tls='tmux ls'

# Quick AI ask
alias '??'='noglob opencode run'
