#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure gpgcheck is globally activated");
  script_summary("Checks if gpgcheck is globally activated");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("cat /etc/yum.conf | grep gpgcheck=1");

if (result != "") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "gpgcheck is globally activated.");
} else {
  security_message(port:0, "gpgcheck is not globally activated.");
}
