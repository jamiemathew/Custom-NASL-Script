#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure sudo is installed");
  script_summary("Checks if the sudo package is installed");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("dpkg -l | grep sudo");

if (result) {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "sudo is installed.");
} else {
  security_message(port:0, "sudo is not installed.");
}
