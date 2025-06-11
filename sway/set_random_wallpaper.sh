#!/bin/bash

# Directorio que contiene los fondos de pantalla
WALLPAPER_DIR="$HOME/Imágenes/wallpapers/"

# Seleccionar una imagen aleatoria
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | shuf -n1)

# Verificar que se encontró una imagen
if [ -n "$WALLPAPER" ]; then
    # Terminar cualquier instancia existente de swaybg
    pkill swaybg

    # Aplicar el fondo de pantalla seleccionado
    swaybg -i "$WALLPAPER" -m fill &
else
    echo "No se encontró ninguna imagen en $WALLPAPER_DIR"
fi

