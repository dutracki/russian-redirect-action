#!/bin/bash
# Install Nginx Redirect Conf
# Run with sudo!
# Usage: curl -sSL <url> | sudo bash

CONF_DIR="/etc/nginx/conf.d"
CONF_FILE="$CONF_DIR/ru_redirect.conf"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

if [ ! -d "$CONF_DIR" ]; then
    echo "Directory $CONF_DIR does not exist. Where is your Nginx configuration?"
    exit 1
fi

cat << 'INNER_EOF' > "$CONF_FILE"
# Nginx RU Redirect Split
split_clients "${msec}" $ru_wiki_url {
    20%   "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)";
    20%   "https://en.wikipedia.org/wiki/Russian_war_crimes";
    20%   "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war";
    20%   "https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War",
    "https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)";
    *     "https://en.wikipedia.org/wiki/Siege_of_Mariupol";
}
INNER_EOF

echo "✅ Nginx redirect logic written to $CONF_FILE"
echo "⚠️  Action Required: You must manually include this inside your server {} block(s):"
echo "    if (\$geoip_country_code = RU) {"
echo "        return 302 \$ru_wiki_url;"
echo "    }"
echo "Running nginx -t..."
nginx -t || true
