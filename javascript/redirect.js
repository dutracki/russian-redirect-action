(function() {
  const wikiUrls = [
    "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
    "https://en.wikipedia.org/wiki/Russian_war_crimes",
    "https://en.wikipedia.org/wiki/Atrocity_crimes_during_the_Russo-Ukrainian_war",
    "https://en.wikipedia.org/wiki/Bucha_massacre",
    "https://en.wikipedia.org/wiki/Casualties_of_the_Russo-Ukrainian_War",
    "https://en.wikipedia.org/wiki/Russian_attacks_on_civilians_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)",
    "https://en.wikipedia.org/wiki/Siege_of_Mariupol",
    "https://en.wikipedia.org/wiki/Child_abductions_in_the_Russo-Ukrainian_war"
  ];

  function doRedirect() {
    const randomUrl = wikiUrls[Math.floor(Math.random() * wikiUrls.length)];
    window.location.replace(randomUrl); // use replace so they can't easily hit back button
  }

  function isRussianTimezone() {
    try {
      const tz = Intl.DateTimeFormat().resolvedOptions().timeZone;
      const ruTimezones = [
        'Europe/Moscow', 'Europe/Samara', 'Europe/Volgograd', 'Europe/Kirov',
        'Europe/Astrakhan', 'Europe/Saratov', 'Europe/Ulyanovsk',
        'Asia/Yekaterinburg', 'Asia/Omsk', 'Asia/Novosibirsk', 'Asia/Barnaul',
        'Asia/Tomsk', 'Asia/Novokuznetsk', 'Asia/Krasnoyarsk', 'Asia/Irkutsk',
        'Asia/Chita', 'Asia/Yakutsk', 'Asia/Khandyga', 'Asia/Vladivostok',
        'Asia/Ust-Nera', 'Asia/Magadan', 'Asia/Sakhalin', 'Asia/Srednekolymsk',
        'Asia/Kamchatka', 'Asia/Anadyr'
      ];
      return ruTimezones.includes(tz);
    } catch (e) {
      return false;
    }
  }

  function checkIPAndExecute() {
    fetch('https://ipapi.co/json/')
      .then(response => response.json())
      .then(data => {
        if (data.country_code === 'RU') {
          doRedirect();
        }
      })
      .catch(() => {
        // Fallback to timezone check if the IP API fails
        if (isRussianTimezone()) {
          doRedirect();
        }
      });
  }

  checkIPAndExecute();
})();
