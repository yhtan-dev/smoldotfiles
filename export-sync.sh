#!/usr/bin/env bash

echo "[*] Syncing noctalia files..."
rm -rf noctalia
mkdir -p noctalia
noctalia config export full > noctalia/noctalia-full-config.toml
cp -r $HOME/.config/noctalia noctalia

echo "[*] Syncing mango files..."
rm -rf mango
mkdir -p mango
cp -r $HOME/.config/mango/* mango/

echo "[*] Syncing zsh and oh my zsh..."
rm -rf zsh
mkdir -p zsh
cp $HOME/.zshrc zsh/.zshrc
mkdir -p zsh/.oh-my-zsh/custom/themes
cp -r $HOME/.oh-my-zsh/custom/themes/* zsh/.oh-my-zsh/custom/themes

echo "[*] Syncing ghostty..."
rm -rf ghostty
mkdir -p ghostty
cp -r $HOME/.config/ghostty/* ghostty

echo "[*] Syncing zed..."
rm -rf zed
mkdir -p zed
cp -r $HOME/.config/zed/* zed
