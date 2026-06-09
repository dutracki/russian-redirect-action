#!/bin/bash
# Uninstall PHP Redirect
TARGET_FILE="${1:-index.php}"

if [ -f "$TARGET_FILE" ]; then
    echo "Removing rules from $TARGET_FILE..."
    TMP_FILE=$(mktemp)
    sed '/\/\/ BEGIN RU_REDIRECT/,/\/\/ END RU_REDIRECT/d' "$TARGET_FILE" > "$TMP_FILE"
    mv "$TMP_FILE" "$TARGET_FILE"
    echo "✅ PHP redirect uninstalled."
else
    echo "File $TARGET_FILE not found."
fi
