#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="${HOME}/dotfiles"

if ! command -v apt >/dev/null 2>&1; then
  echo "This script currently targets Debian/Ubuntu-style systems with apt."
  echo "Install dependencies manually on your distro, then run stow commands from the README."
  exit 1
fi

sudo apt update
sudo apt install -y zsh tmux stow neovim zoxide ripgrep fd-find git curl

if ! command -v starship >/dev/null 2>&1; then
  curl -fsSL https://starship.rs/install.sh | sh
fi

mkdir -p "${HOME}/.tmux/plugins"
if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
fi

mkdir -p "${HOME}/.local/share/nvim/lazy"
if [ ! -d "${HOME}/.local/share/nvim/lazy/lazy.nvim" ]; then
  git clone https://github.com/folke/lazy.nvim.git "${HOME}/.local/share/nvim/lazy/lazy.nvim"
fi

cd "${REPO_DIR}"
stow -R nvim ghostty tmux starship
stow -R -t "${HOME}" zsh

"${HOME}/.tmux/plugins/tpm/bin/install_plugins" || true
nvim --headless "+q" || true

cat <<'EOF'
Linux bootstrap complete.

Notes:
- Install Ghostty separately for your distro if you want to use it.
- Start a new shell with: exec zsh
EOF
