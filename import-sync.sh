#!/usr/bin/env bash

echo "This will override your current configuration for the following:"
echo "  ~/.config/mango"
echo "  ~/.config/ghostty"
echo "  ~/.config/noctalia"
echo "  ~/.zshrc"
echo "  ~/.oh-my-zsh/custom/themes"

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "[*] Syncing noctalia files..."
noctalia config import full < noctalia/noctalia-full-config.toml

echo "[*] Syncing mango files..."
mkdir -p $HOME/.config/mango
cp -r mango/* $HOME/.config/mango/

echo "[*] Syncing zsh and oh my zsh..."
cp zsh/.zshrc $HOME/.zshrc
mkdir -p $HOME/.oh-my-zsh/custom
cp -r zsh/.oh-my-zsh/custom/themes $HOME/.oh-my-zsh/custom/

echo "[*] Syncing ghostty..."
mkdir -p $HOME/.config/ghostty
cp -r ghostty/* $HOME/.config/ghostty/
