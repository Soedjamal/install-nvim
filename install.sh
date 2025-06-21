#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1hImi2NrbDGgu3QxnBN4vqJkefAURxdb0"
FILE_NAME="lazy-nvim-main.zip"
TEMP_DIR="$HOME/.config/nvim-temp"

echo "Mengunduh template..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

# Buat folder sementara untuk ekstraksi isi zip
mkdir -p "$TEMP_DIR"
unzip -o "$FILE_NAME" -d "$TEMP_DIR"

# Pindahkan isi folder hasil ekstrak ke direktori Neovim config
mkdir -p "$CONFIG_DIR"
cp -r "$TEMP_DIR/lazy-nvim-main/"* "$CONFIG_DIR/"

# Bersihkan file sementara
rm -rf "$TEMP_DIR"
rm -f "$FILE_NAME"

echo "Instalasi selesai. Silakan buka Neovim untuk mulai menggunakan template Anda."
