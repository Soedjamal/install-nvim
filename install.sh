#!/bin/bash

CONFIG_DIR="$HOME/.config/nvim"
DOWNLOAD_URL="https://drive.google.com/uc?export=download&id=1_Eph4mrpR5Y1rokDlEvfAslBr1LK42Y2"
FILE_NAME="lazy-nvim-main.zip"
TEMP_DIR="$HOME/.config/nvim-temp"

echo "Mengunduh template..."
wget --quiet --no-check-certificate "$DOWNLOAD_URL" -O "$FILE_NAME"

# Cek apakah file berhasil diunduh
if [ ! -f "$FILE_NAME" ]; then
  echo "❌ Gagal mengunduh file ZIP. Periksa URL atau koneksi internet."
  exit 1
fi

# Ekstrak ke folder sementara
mkdir -p "$TEMP_DIR"
unzip -o "$FILE_NAME" -d "$TEMP_DIR"

# Pastikan folder hasil ekstrak ada
if [ ! -d "$TEMP_DIR/lazy-nvim-main" ]; then
  echo "❌ Struktur ZIP tidak valid atau gagal diekstrak."
  exit 1
fi

# Buat folder konfigurasi dan salin isi
mkdir -p "$CONFIG_DIR"
cp -r "$TEMP_DIR/lazy-nvim-main/"* "$CONFIG_DIR/"

# Bersihkan
rm -rf "$TEMP_DIR"
rm -f "$FILE_NAME"

echo "✅ Instalasi selesai. Silakan buka Neovim untuk mulai menggunakan template Anda."
