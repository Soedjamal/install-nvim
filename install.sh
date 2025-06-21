#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1hImi2NrbDGgu3QxnBN4vqJkefAURxdb0" # ganti dengan ID kamu
FILE_NAME="lazy-nvim-main.zip"
TEMP_DIR="$HOME/.config/nvim-temp"

echo "📥 Mengunduh file konfigurasi Neovim..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

if [ ! -f "$FILE_NAME" ]; then
  echo "❌ Gagal mengunduh file ZIP. Cek kembali link Google Drive kamu."
  exit 1
fi

echo "📦 Mengekstrak file..."
mkdir -p "$TEMP_DIR"
unzip -o "$FILE_NAME" -d "$TEMP_DIR"

if [ ! -d "$TEMP_DIR/lazy-nvim" ]; then
  echo "❌ Folder 'lazy-nvim' tidak ditemukan dalam ZIP. Pastikan isi ZIP benar (harus dalam folder lazy-nvim/)."
  exit 1
fi

echo "🚀 Memasang ke $CONFIG_DIR ..."
rm -rf "$CONFIG_DIR"
mv "$TEMP_DIR/lazy-nvim" "$CONFIG_DIR"

# Bersih-bersih
rm -rf "$TEMP_DIR"
rm -f "$FILE_NAME"

echo "✅ Instalasi selesai! Silakan buka Neovim 🚀"
