<?php
// php/redirect.php
$wikiUrls = [
    "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
    "https://en.wikipedia.org/wiki/Russian_war_crimes",
    "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
    "https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War",
    "https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
    "https://en.wikipedia.org/wiki/Siege_of_Mariupol",
    "https://en.wikipedia.org/wiki/Child_abductions_in_the_Russo-Ukrainian_war"
];

// Determine country. Works behind Cloudflare, or falls back to server GeoIP if available
$country = '';
if (isset($_SERVER["HTTP_CF_IPCOUNTRY"])) {
    $country = $_SERVER["HTTP_CF_IPCOUNTRY"];
} elseif (function_exists('geoip_country_code_by_name')) {
    $country = @geoip_country_code_by_name($_SERVER['REMOTE_ADDR']);
}

if ($country === 'RU') {
    $randomUrl = $wikiUrls[array_rand($wikiUrls)];
    header("Location: " . $randomUrl, true, 302);
    exit();
}
?>