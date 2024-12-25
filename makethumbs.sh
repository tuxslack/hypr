#!/bin/bash

# Caminhos das pastas
SRC_DIR="$HOME/.scripts/hypr/wallpapers"
THUMB_DIR="$HOME/.scripts/hypr/wallpapers/.thumb"

# Verifica se a pasta de thumbnails existe, senão cria ela
if [ ! -d "$THUMB_DIR" ]; then
  mkdir -p "$THUMB_DIR"
fi

# Remove todas as thumbs existentes
rm -f "$THUMB_DIR"/*

# Conta o número total de imagens
total_files=$(ls "$SRC_DIR"/*.* | wc -l)
count=0

(
for img in "$SRC_DIR"/*.*; do
  # Pega o nome do arquivo sem o caminho
  filename=$(basename "$img")
  # Define o caminho do thumbnail
  thumb_path="$THUMB_DIR/$filename"
  # Redimensiona a imagem
  magick "$img" -resize 250x142 "$thumb_path"
  
  # Incrementa o contador
  count=$((count + 1))
  
  # Calcula o progresso
  progress=$((count * 100 / total_files))
  
  # Atualiza a barra de progresso do yad
  echo "$progress"
  echo "# Processando $filename"
done

) | zenity --progress \
           --title="Criando Thumbnails" \
           --text="Iniciando..." \
           --percentage=0 \
           --auto-close

if [ "$?" = -1 ] ; then
  zenity --error --text="Processo cancelado."
else
  zenity --info --text="Reinicie o aplicativo para que as alterações tenham efeito."
fi

