<?php
// wordpress/functions.php
add_action('template_redirect', 'ru_traffic_redirect');
function ru_traffic_redirect() {
    $wikiUrls = [
        "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
        "https://en.wikipedia.org/wiki/Russian_war_crimes",
        "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
        "https://en.wikipedia.org/wiki/Bucha_massacre",
        "https://en.wikipedia.org/wiki/Siege_of_Mariupol"
    ];

    $country = '';
    if (isset($_SERVER["HTTP_CF_IPCOUNTRY"])) {
        $country = $_SERVER["HTTP_CF_IPCOUNTRY"];
    } elseif (isset($_SERVER['GEOIP_COUNTRY_CODE'])) {
        $country = $_SERVER['GEOIP_COUNTRY_CODE'];
    }

    if ($country === 'RU') {
        $randomUrl = $wikiUrls[array_rand($wikiUrls)];
        wp_redirect($randomUrl, 302);
        exit();
    }
}
?>