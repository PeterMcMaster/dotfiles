# dotfiles

Personal dotfiles managed with GNU Stow.

This repo is primarily used to link config into:
- `~/.config/<app>/...`
- `~/.zshrc`

## What is here

Packages in this repo:
- `zsh`
- `starship`
- `ghostty`
- `tmux`
- `nvim`
- `aerospace`

Notes:
- `aerospace` is macOS-only.
- `ghostty` works on both macOS and Linux, but config syntax can vary by Ghostty version.
- `tmux` uses TPM plugins.
- `nvim` uses `lazy.nvim`.

## Repo Layout

This repo uses a Stow layout.

Examples:
- `ghostty/ghostty/config` -> `~/.config/ghostty/config`
- `nvim/nvim/init.lua` -> `~/.config/nvim/init.lua`
- `zsh/.zshrc` -> `~/.zshrc`

## macOS Install

Fast path:

```zsh
cd ~/dotfiles
./bootstrap-macos.sh
```

### 1. Install dependencies

Install Homebrew first if needed, then:

```zsh
brew install stow tmux neovim starship zoxide ripgrep fd tree-sitter git curl
brew install --cask ghostty
brew install --cask nikitabobko/tap/aerospace
```

### 2. Clone the repo

```zsh
git clone https://github.com/PeterMcMaster/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Stow the config

```zsh
stow nvim ghostty aerospace tmux starship
stow -t ~ zsh
```

If you want to preview first:

```zsh
stow -n -v nvim ghostty aerospace tmux starship
stow -n -v -t ~ zsh
```

### 4. Install tmux plugins

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
```

### 5. Install Neovim plugin manager

```zsh
mkdir -p ~/.local/share/nvim/lazy
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

Then open Neovim once:

```zsh
nvim
```

### 6. Finish macOS-specific setup

- Launch `Ghostty`
- Launch `AeroSpace.app`
- Grant AeroSpace Accessibility permissions in macOS Settings

## Linux Install

Fast path:

```zsh
cd ~/dotfiles
./bootstrap-linux.sh
```

### 1. Install dependencies

Package names vary by distro. On Debian/Ubuntu:

```zsh
sudo apt update
sudo apt install -y zsh tmux stow neovim zoxide ripgrep fd-find git curl
```

Optional:

```zsh
sudo apt install -y tree-sitter-cli
```

Install Starship separately if it is not available in your distro packages:

```zsh
curl -fsSL https://starship.rs/install.sh | sh
```

Ghostty installation depends on distro and how recent a build you want. Install Ghostty separately using your distro package, package repo, or official release process.

Do not install or stow `aerospace` on Linux.

### 2. Clone the repo

```zsh
git clone https://github.com/PeterMcMaster/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Stow the config

```zsh
stow nvim ghostty tmux starship
stow -t ~ zsh
```

Preview first if needed:

```zsh
stow -n -v nvim ghostty tmux starship
stow -n -v -t ~ zsh
```

### 4. Install tmux plugins

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
```

### 5. Install Neovim plugin manager

```zsh
mkdir -p ~/.local/share/nvim/lazy
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

Then open Neovim once:

```zsh
nvim
```

## Updating

From inside the repo:

```zsh
cd ~/dotfiles
git status
git add .
git commit -m "Update dotfiles"
git push
```

## Verification

Useful checks after install:

```zsh
ghostty +validate-config
nvim --headless "+q"
tmux -V
starship --version
```

Check links:

```zsh
ls -l ~/.zshrc
ls -l ~/.config/ghostty
ls -l ~/.config/nvim
ls -l ~/.config/starship
ls -l ~/.config/tmux
```

## Platform Notes

- `aerospace` is for macOS only.
- `pbcopy` in the tmux config is macOS-specific clipboard behavior.
- `zsh/.zshrc` includes a small Linux-specific `TERM` guard for Ghostty.
- Ghostty config may need adjustment if a future Ghostty release changes keybind syntax again.
