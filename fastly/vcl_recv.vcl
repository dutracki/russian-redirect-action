# fastly/vcl_recv.vcl
# Place this in your vcl_recv

if (client.geo.country_code == "RU") {
  # Fastly doesn't easily do random numbers natively without math tricks or time variables.
  # So we will redirect based on the last digit of the time seconds.
  declare local var.sec STRING;
  set var.sec = time.run.sec;
  
  if (var.sec ~ "[0-3]$") {
      error 701 "https://en.wikipedia.org/wiki/War_crimes_in_the_Russo-Ukrainian_war_(2022%E2%80%93present)";
  } elseif (var.sec ~ "[4-6]$") {
      error 701 "https://en.wikipedia.org/wiki/Russian_war_crimes";
  } else {
      error 701 "https://en.wikipedia.org/wiki/Bucha_massacre";
  }
}

# Add this in your vcl_error block to handle the custom error code:
# if (obj.status == 701) {
#     set obj.status = 302;
#     set obj.http.Location = obj.response;
#     return(deliver);
# }
