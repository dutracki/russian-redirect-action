# varnish/default.vcl
vcl 4.0;

import std;

sub vcl_recv {
    # Assuming Cloudflare headers
    if (req.http.CF-IPCountry == "RU") {
        return (synth(701, "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)"));
    }
}

sub vcl_synth {
    if (resp.status == 701) {
        set resp.status = 302;
        set resp.http.Location = resp.reason;
        return (deliver);
    }
}
