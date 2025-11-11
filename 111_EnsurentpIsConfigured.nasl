#!/usr/bin/env nasl

if (description)
{
  script_id(123456);
  script_version("1.0");
  script_cve_id("N/A");
  script_bugtraq_id(00000000);
  script_xref(name:"SeeAlso", value:"http://www.example.com/");
  script_name("Check NTP configuration");
  script_summary("Ensure NTP is properly configured");
  exit(0);
}

ntp_conf = "/etc/ntp.conf";

# Check if ntp.conf file exists
if (file_exist(ntp_conf)) {
  # Check if NTP servers are specified in the ntp.conf file
  content = cat(ntp_conf);
  if (ereg("^server [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+", content)) {
    security_message(data: "NTP is properly configured");
  } else {
    security_message(data: "NTP is not properly configured - No NTP servers specified");
  }
} else {
  security_message(data: "NTP is not properly configured - ntp.conf file not found");
}
