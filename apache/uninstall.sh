#!/bin/bash
# Uninstall Apache Redirect
TARGET_DIR="${1:-.}"
HTACCESS_FILE="$TARGET_DIR/.htaccess"

if [ -f "$HTACCESS_FILE" ]; then
    echo "Removing rules from $HTACCESS_FILE..."
    TMP_FILE=$(mktemp)
    sed '/# BEGIN RU_REDIRECT/,/# END RU_REDIRECT/d' "$HTACCESS_FILE" > "$TMP_FILE"
    mv "$TMP_FILE" "$HTACCESS_FILE"
    echo "✅ Apache redirect uninstalled."
else
    echo "File $HTACCESS_FILE not found."
fi
