#!/usr/bin/env bash

WORKSHOP_DIR="/home/elliot/.steam/root/steamapps/workshop/content/431960"

WP_ID=$(pgrep -af linux-wallpaperengine | grep -oP '\d{10,}' | head -n 1)

if [ -z "$WP_ID" ]; then
    echo "No running Wallpaper Engine process found."
    exit 1
fi

# 3. Path to the preview image
PREVIEW_PATH_1="$WORKSHOP_DIR/$WP_ID/preview.gif"
PREVIEW_PATH_2="$WORKSHOP_DIR/$WP_ID/preview.jpg"

if [ -f "$PREVIEW_PATH_1" ]; then
    echo "Updating theme with preview for ID: $WP_ID"
    matugen image "$PREVIEW_PATH_1" --prefer=saturation
    if ! cmp -s /home/elliot/.config/matugen/templates/colors_new.qml /home/elliot/nixos/modules/quickshell/Matugen.qml; then \
            mv /home/elliot/.config/matugen/templates/colors_new.qml /home/elliot/nixos/modules/quickshell/Matugen.qml && exit 0; \
            else \
            exit 1; \
            fi

elif [-f "$PREVIEW_PATH_2"]; then
    echo "Updating theme with preview for ID: $WP_ID"
    matugen image "$PREVIEW_PATH_2"
else
    echo "Preview image not found at $PREVIEW_PATH"
    # Fallback: take a live screenshot of the screen (requires grim for Wayland)
    # grim -t jpeg /tmp/wp_snap.jpg && matugen image /tmp/wp_snap.jpg
fi