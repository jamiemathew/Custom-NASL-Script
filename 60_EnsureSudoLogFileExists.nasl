#!/usr/bin/nasl

if (description)
{
  script_id(955555555);
  script_version("1.0");
  script_family("Misc");
  script_name("Ensure sudo log file exists");
  script_summary("Checks if a log file for sudo exists");
  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("find /var/log/ -name 'sudo.log'");

if (!result) {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "A log file for sudo exists.");
  exit(1);
} else {
  security_message(port:0, "A log file for sudo does not exist.");
  exit(0);
}
