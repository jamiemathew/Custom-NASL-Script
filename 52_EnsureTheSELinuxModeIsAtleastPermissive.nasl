#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure SELinux mode is at least permissive");
  script_summary("Checks if the SELinux mode is at least permissive");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("getenforce");

if (result =~ "Permissive" || result =~ "Enforcing") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "SELinux mode is at least permissive.");
} else {
  security_message(port:0, "SELinux mode is not at least permissive.");
}
