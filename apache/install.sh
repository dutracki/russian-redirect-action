#!/bin/bash
# Install Apache Redirect
# Usage: curl -sSL <url> | bash -s /var/www/html

TARGET_DIR="${1:-.}"
HTACCESS_FILE="$TARGET_DIR/.htaccess"

echo "Adding rules to $HTACCESS_FILE..."

cat << 'INNER_EOF' >> "$HTACCESS_FILE"

# BEGIN RU_REDIRECT
# Added by russian-redirect-action
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^RU$ [OR]
RewriteCond %{HTTP:CF-IPCountry} ^RU$
RewriteCond %{TIME_SEC} [01]$
RewriteRule ^ https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%%E2%%80%%93present) [L,R=302,NE]
RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^RU$ [OR]
RewriteCond %{HTTP:CF-IPCountry} ^RU$
RewriteCond %{TIME_SEC} [23]$
RewriteRule ^ https://en.wikipedia.org/wiki/Russian_war_crimes [L,R=302,NE]
RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^RU$ [OR]
RewriteCond %{HTTP:CF-IPCountry} ^RU$
RewriteCond %{TIME_SEC} [45]$
RewriteRule ^ https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war [L,R=302,NE]
RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^RU$ [OR]
RewriteCond %{HTTP:CF-IPCountry} ^RU$
RewriteCond %{TIME_SEC} [67]$
RewriteRule ^ https://en.wikipedia.org/wiki/Bucha_massacre [L,R=302,NE]
RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^RU$ [OR]
RewriteCond %{HTTP:CF-IPCountry} ^RU$
RewriteCond %{TIME_SEC} [89]$
RewriteRule ^ https://en.wikipedia.org/wiki/Siege_of_Mariupol [L,R=302,NE]
</IfModule>
# END RU_REDIRECT
INNER_EOF

echo "✅ Apache redirect installed in $HTACCESS_FILE"
