#!/usr/bin/env nasl

if (description)
{
  script_id(123456);
  script_version("1.0");
  script_cve_id("N/A");
  script_bugtraq_id(00000000);
  script_xref(name:"SeeAlso", value:"http://www.example.com/");
  script_name("Check time synchronization");
  script_summary("Ensure time synchronization is in use");
  exit(0);
}

include("version_func.inc");

flag = 0;

# Check if ntpd or chronyd service is running
service_name = get_service_name();
if (service_name == "ntpd") {
  if (is_service_running(service_name)) {
    flag = 1;
  }
} else if (service_name == "chronyd") {
  if (is_service_running(service_name)) {
    flag = 1;
  }
}

# Check if the system clock is synchronized with NTP servers
if (flag == 1) {
  result = open_sock_tcp(port: 123);
  if (result == NULL) {
    security_message(port:123, data: "Time synchronization service not running");
  } else {
    security_message(port:123, data: "Time synchronization is in use");
  }
} else {
  security_message(port:123, data: "Time synchronization service not running");
}
