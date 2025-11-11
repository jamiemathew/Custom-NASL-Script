#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure IPv6 is disabled");
  script_summary("Checks if IPv6 is disabled");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("sysctl net.ipv6.conf.all.disable_ipv6");

if (result && result =~ "net.ipv6.conf.all.disable_ipv6 = 1") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "IPv6 is disabled.");
} else {
  security_message(port:0, "IPv6 is not disabled.");
}
