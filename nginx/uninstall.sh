#!/bin/bash
# Uninstall Nginx Redirect Conf
# Run with sudo!
CONF_FILE="/etc/nginx/conf.d/ru_redirect.conf"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

if [ -f "$CONF_FILE" ]; then
    rm "$CONF_FILE"
    echo "✅ Nginx redirect configuration removed from $CONF_FILE"
    echo "⚠️  Action Required: You must manually remove the 'if (\$geoip_country_code = RU)' block from your server {} block(s)."
    echo "Running nginx -t..."
    nginx -t || true
else
    echo "File $CONF_FILE not found."
fi
