#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1_cHxNOdpHwM7uHpiwl_gXSmCqy6AKfQI"
FILE_NAME="lazy-nvim-main.zip"

echo "Mengunduh template..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

mkdir -p "$CONFIG_DIR"
unzip -o "$FILE_NAME" -d "$CONFIG_DIR"

# Salin semua isi dari lazy-nvim-main ke config dir
cp -r "$CONFIG_DIR/lazy-nvim-main/"* "$CONFIG_DIR/"

# Bersihkan sisa folder
rm -rf "$CONFIG_DIR/lazy-nvim-main"
rm "$FILE_NAME"

echo "Instalasi selesai. Silakan buka Neovim untuk mulai menggunakan template Anda."
