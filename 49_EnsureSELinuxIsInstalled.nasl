#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure SELinux is installed");
  script_summary("Checks if SELinux is installed on the system");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("which selinuxenabled");

if (result != "") {
  flag = 1;
}

result = exec_bash("which setenforce");

if (result != "") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "SELinux is installed on the system.");
} else {
  security_message(port:0, "SELinux is not installed on the system.");
}
