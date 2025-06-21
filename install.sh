#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1hImi2NrbDGgu3QxnBN4vqJkefAURxdb0" # Ganti dengan ID kamu
FILE_NAME="lazy-nvim-main.zip"
TEMP_DIR="$HOME/.config/nvim-temp"

echo "📥 Mengunduh konfigurasi Neovim..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

if [ ! -f "$FILE_NAME" ]; then
  echo "❌ Gagal mengunduh file ZIP. Periksa kembali URL Google Drive."
  exit 1
fi

echo "📦 Mengekstrak file..."
mkdir -p "$TEMP_DIR"
unzip -o "$FILE_NAME" -d "$TEMP_DIR"

# Deteksi folder hasil ekstraksi
EXTRACTED_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "lazy-nvim-main")

if [ ! -d "$EXTRACTED_DIR" ]; then
  echo "❌ Folder 'lazy-nvim-main' tidak ditemukan. Periksa isi ZIP."
  rm -rf "$TEMP_DIR" "$FILE_NAME"
  exit 1
fi

echo "🚀 Memasang konfigurasi ke $CONFIG_DIR..."
rm -rf "$CONFIG_DIR"
mv "$EXTRACTED_DIR" "$CONFIG_DIR"

# Bersihkan
rm -rf "$TEMP_DIR"
rm -f "$FILE_NAME"

echo "✅ Instalasi selesai! Jalankan Neovim 🚀"
