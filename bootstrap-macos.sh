#!/usr/bin/env zsh

set -euo pipefail

REPO_DIR="${HOME}/dotfiles"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Install it first: https://brew.sh"
  exit 1
fi

brew install stow tmux neovim starship zoxide ripgrep fd tree-sitter git curl
brew install --cask ghostty
brew install --cask nikitabobko/tap/aerospace

mkdir -p "${HOME}/.tmux/plugins"
if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
fi

mkdir -p "${HOME}/.local/share/nvim/lazy"
if [ ! -d "${HOME}/.local/share/nvim/lazy/lazy.nvim" ]; then
  git clone https://github.com/folke/lazy.nvim.git "${HOME}/.local/share/nvim/lazy/lazy.nvim"
fi

cd "${REPO_DIR}"
stow -R nvim ghostty aerospace tmux starship
stow -R -t "${HOME}" zsh

"${HOME}/.tmux/plugins/tpm/bin/install_plugins" || true
nvim --headless "+q" || true

cat <<'EOF'
macOS bootstrap complete.

Next manual steps:
- Launch Ghostty
- Launch AeroSpace.app
- Grant AeroSpace Accessibility permissions in macOS Settings
- Start a new shell with: exec zsh
EOF
