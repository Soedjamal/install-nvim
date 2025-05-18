#!/bin/bash

Membuat direktori untuk font

mkdir -p myfont cd myfont || exit

Mengunduh font JetBrainsMono

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip

Mengekstrak file zip

unzip -o JetBrainsMono.zip

Menyalin font ke direktori Termux

cp JetBrainsMonoNerdFont-Bold.ttf ~/.termux/font.ttf

Menampilkan pesan selesai

echo "Instalasi selesai. Silakan keluar untuk me-refresh font." echo "Ketik 'exit' untuk keluar."

