#!/bin/bash
# Uninstall WordPress Must-Use Plugin
WP_DIR="${1:-.}"
PLUGIN_FILE="$WP_DIR/wp-content/mu-plugins/ru-redirect.php"

if [ -f "$PLUGIN_FILE" ]; then
    rm "$PLUGIN_FILE"
    echo "✅ WordPress RU Redirect plugin removed."
else
    echo "Plugin $PLUGIN_FILE not found."
fi
