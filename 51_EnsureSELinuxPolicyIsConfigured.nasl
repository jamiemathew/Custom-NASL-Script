#!/usr/bin/nasl

if (description)
{
  
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure SELinux policy is configured");
  script_summary("Checks if the SELinux policy is configured");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("sestatus");

if (result =~ "SELinux status: enabled") {
  flag = 1;
}

result = exec_bash("getenforce");

if (result =~ "Enforcing") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "SELinux policy is configured.");
} else {
  security_message(port:0, "SELinux policy is not configured.");
}
