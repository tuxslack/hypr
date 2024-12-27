#!/usr/bin/env bash

NEW_WP=$1

# Limpar o arquivo de configuração do hyprpaper
echo '' > $HOME/.config/hypr/hyprpaper.conf
# Mudar o conteúdo: hyprpaper.conf
echo "preload = $NEW_WP" >> $HOME/.config/hypr/hyprpaper.conf
echo "wallpaper = HDMI-A-1,$NEW_WP" >> $HOME/.config/hypr/hyprpaper.conf
echo "splash = false" >> $HOME/.config/hypr/hyprpaper.conf

killall hyprpaper
hyprpaper & disown
