#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
FILE_ID="1hImi2NrbDGgu3QxnBN4vqJkefAURxdb0" # Ganti dengan ID milikmu
FILE_NAME="lazy-nvim-main.zip"
TEMP_DIR="$HOME/.config/nvim-temp"

download_from_drive() {
  FILEID=$1
  FILENAME=$2
  CONFIRM=$(curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${FILEID}" | \
            grep -o 'confirm=[^&]*' | sed 's/confirm=//')
  curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILEID}" -o "${FILENAME}"
}

echo "📥 Mengunduh file konfigurasi Neovim..."
download_from_drive "$FILE_ID" "$FILE_NAME"

if [ ! -f "$FILE_NAME" ]; then
  echo "❌ Gagal mengunduh file ZIP."
  exit 1
fi

echo "📦 Mengekstrak file..."
mkdir -p "$TEMP_DIR"
unzip -o "$FILE_NAME" -d "$TEMP_DIR"

EXTRACTED_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "lazy-nvim-main")

if [ ! -d "$EXTRACTED_DIR" ]; then
  echo "❌ Folder 'lazy-nvim-main' tidak ditemukan. Periksa isi ZIP."
  rm -rf "$TEMP_DIR" "$FILE_NAME"
  exit 1
fi

echo "🚀 Memasang ke $CONFIG_DIR..."
rm -rf "$CONFIG_DIR"
mv "$EXTRACTED_DIR" "$CONFIG_DIR"

rm -rf "$TEMP_DIR"
rm -f "$FILE_NAME"

echo "✅ Instalasi selesai! Silakan buka Neovim 🚀"
