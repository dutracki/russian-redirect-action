#!/bin/bash
# Uninstall JS Shadow Prefetch
TARGET_FILE="${1:-index.html}"

if [ -f "$TARGET_FILE" ]; then
    echo "Removing script from $TARGET_FILE..."
    TMP_FILE=$(mktemp)
    sed 's|<script src="https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/javascript/shadow-prefetch.js"></script>||g' "$TARGET_FILE" > "$TMP_FILE"
    mv "$TMP_FILE" "$TARGET_FILE"
    echo "✅ Shadow prefetch script removed."
else
    echo "File $TARGET_FILE not found."
fi
