#!/bin/bash
# Install WordPress Must-Use Plugin
# Usage: curl -sSL <url> | bash -s /path/to/wordpress/root

WP_DIR="${1:-.}"
MU_DIR="$WP_DIR/wp-content/mu-plugins"
PLUGIN_FILE="$MU_DIR/ru-redirect.php"

if [ ! -d "$WP_DIR/wp-content" ]; then
    echo "Directory $WP_DIR does not look like a WordPress installation."
    exit 1
fi

mkdir -p "$MU_DIR"

cat << 'INNER_EOF' > "$PLUGIN_FILE"
<?php
/*
Plugin Name: Russian Traffic Redirect
Description: Automatically redirects Russian traffic to Wikipedia articles about the war.
Version: 1.0
Author: russian-redirect-action
*/

add_action('template_redirect', 'ru_traffic_redirect');
function ru_traffic_redirect() {
    $wikiUrls = [
        "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
        "https://en.wikipedia.org/wiki/Russian_war_crimes",
        "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
        "https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War",
    "https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
        "https://en.wikipedia.org/wiki/Siege_of_Mariupol"
    ];

    $country = '';
    if (isset($_SERVER["HTTP_CF_IPCOUNTRY"])) {
        $country = $_SERVER["HTTP_CF_IPCOUNTRY"];
    } elseif (isset($_SERVER['GEOIP_COUNTRY_CODE'])) {
        $country = $_SERVER['GEOIP_COUNTRY_CODE'];
    } elseif (function_exists('geoip_country_code_by_name')) {
        $country = @geoip_country_code_by_name($_SERVER['REMOTE_ADDR']);
    }

    if ($country === 'RU') {
        $randomUrl = $wikiUrls[array_rand($wikiUrls)];
        wp_redirect($randomUrl, 302);
        exit();
    }
}
INNER_EOF

echo "✅ WordPress RU Redirect installed as a Must-Use plugin at $PLUGIN_FILE"
echo "It will run automatically and cannot be accidentally disabled in the WP Admin UI."
