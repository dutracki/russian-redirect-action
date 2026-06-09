#!/bin/bash
# Install JS Shadow Prefetch
# Usage: curl -sSL <url> | bash -s /path/to/index.html

TARGET_FILE="${1:-index.html}"

if [ ! -f "$TARGET_FILE" ]; then
    echo "File $TARGET_FILE not found."
    exit 1
fi

# We will inject the script right before </head>
TMP_FILE=$(mktemp)

SCRIPT_TAG="<script src=\"https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/russian-redirect-action/main/javascript/shadow-prefetch.js\"></script>"

# Replace </head> with our script + </head>
sed "s|</head>|$SCRIPT_TAG</head>|i" "$TARGET_FILE" > "$TMP_FILE"

mv "$TMP_FILE" "$TARGET_FILE"

echo "✅ Shadow prefetch script injected into $TARGET_FILE"
