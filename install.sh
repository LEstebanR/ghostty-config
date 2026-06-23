#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Powerlevel10k
if ! brew list powerlevel10k &>/dev/null; then
  brew install powerlevel10k
fi

# Plugins Zsh
brew install zsh-syntax-highlighting zsh-autosuggestions fzf

# Fuente
brew install --cask font-iosevka-nerd-font

# Symlinks del shell
ln -sf "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo "Setup completo. Abre una terminal nueva para aplicar los cambios."
