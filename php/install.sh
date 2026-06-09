#!/bin/bash
# Install PHP Redirect
# Usage: curl -sSL <url> | bash -s /path/to/index.php

TARGET_FILE="${1:-index.php}"

if [ ! -f "$TARGET_FILE" ]; then
    echo "File $TARGET_FILE not found. Please provide the path to your index.php."
    exit 1
fi

if grep -q "ru_traffic_redirect" "$TARGET_FILE"; then
    echo "Redirect already seems to be installed in $TARGET_FILE"
    exit 0
fi

# Create a temporary file
TMP_FILE=$(mktemp)

# Write the payload
cat << 'INNER_EOF' > "$TMP_FILE"
<?php
// BEGIN RU_REDIRECT
$ru_wikiUrls = ["https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)","https://en.wikipedia.org/wiki/Russian_war_crimes","https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war","https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War",
    "https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)","https://en.wikipedia.org/wiki/Siege_of_Mariupol"];
$ru_country = isset($_SERVER["HTTP_CF_IPCOUNTRY"]) ? $_SERVER["HTTP_CF_IPCOUNTRY"] : (function_exists('geoip_country_code_by_name') ? @geoip_country_code_by_name($_SERVER['REMOTE_ADDR']) : '');
if ($ru_country === 'RU') { header("Location: " . $ru_wikiUrls[array_rand($ru_wikiUrls)], true, 302); exit(); }
// END RU_REDIRECT
?>
INNER_EOF

# Append the original file content
cat "$TARGET_FILE" >> "$TMP_FILE"

# Replace the original file
mv "$TMP_FILE" "$TARGET_FILE"

echo "✅ PHP Redirect safely prepended to $TARGET_FILE"
