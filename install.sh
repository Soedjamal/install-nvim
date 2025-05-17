#!/bin/bash

# Direktori konfigurasi Neovim
CONFIG_DIR="$HOME/.config/nvim"

# URL download template (Google Drive atau GitHub)
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1_cHxNOdpHwM7uHpiwl_gXSmCqy6AKfQI"

# Nama file ZIP
FILE_NAME="lazy-nvim-main.zip"

# Unduh template
echo "Mengunduh template..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

# Buat direktori konfigurasi jika belum ada
mkdir -p "$CONFIG_DIR"

# Ekstrak hanya isinya ke direktori konfigurasi Neovim
unzip -o "$FILE_NAME" -d "$CONFIG_DIR" && \
mv "$CONFIG_DIR/lazy-nvim-main/"* "$CONFIG_DIR/" && \
rm -rf "$CONFIG_DIR/lazy-nvim-main"

# Hapus file ZIP setelah ekstraksi
rm "$FILE_NAME"

echo "Instalasi selesai. Silakan buka Neovim untuk mulai menggunakan template Anda."
