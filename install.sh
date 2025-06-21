#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1_Eph4mrpR5Y1rokDlEvfAslBr1LK42Y2"
FILE_NAME="lazy-nvim-main.zip"
TEMP_DIR="$HOME/.config/nvim-temp"

echo "🔽 Mengunduh template..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

if [ ! -f "$FILE_NAME" ]; then
  echo "❌ Gagal mengunduh file ZIP. Periksa URL Google Drive."
  exit 1
fi

mkdir -p "$TEMP_DIR"
unzip -o "$FILE_NAME" -d "$TEMP_DIR"

if [ ! -d "$TEMP_DIR/lazy-nvim-main" ]; then
  echo "❌ Gagal mengekstrak. File ZIP mungkin tidak valid."
  rm -rf "$TEMP_DIR" "$FILE_NAME"
  exit 1
fi

mkdir -p "$CONFIG_DIR"
cp -r "$TEMP_DIR/lazy-nvim-main/"* "$CONFIG_DIR/"

rm -rf "$TEMP_DIR"
rm -f "$FILE_NAME"

echo "✅ Instalasi selesai. Silakan buka Neovim."
