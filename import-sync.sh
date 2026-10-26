#!/usr/bin/env bash

echo "This will override your current configuration for the following:"
echo "  ~/.config/mango"
echo "  ~/.config/ghostty"
echo "  ~/.config/noctalia"
echo "  ~/.config/zed"
echo "  ~/.zshrc"
echo "  ~/.oh-my-zsh/custom/themes"

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "[*] Syncing noctalia files..."
cp noctalia/noctalia-full-config.toml $HOME/.config/noctalia/config.toml

echo "[*] Syncing mango files..."
mkdir -p $HOME/.config/mango
cp -r mango/* $HOME/.config/mango/

echo "[*] Syncing zsh and oh my zsh..."
cp zsh/.zshrc $HOME/.zshrc
mkdir -p $HOME/.oh-my-zsh/custom
cp -r zsh/.oh-my-zsh/custom/themes $HOME/.oh-my-zsh/custom/

echo "[*] Syncing ghostty..."
mkdir -p $HOME/.config/ghostty
rm -r $HOME/.config/ghostty
cp -r ghostty/* $HOME/.config/ghostty

echo "[*] Syncing zed..."
rm -rf $HOME/.config/zed
mkdir -p $HOME/.config/zed
cp -r zed/* $HOME/.config/zed
