#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure sudo commands use pty");
  script_summary("Checks if sudo commands are using a pty");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("sudo grep Defaults.*requiretty /etc/sudoers");

if (!result) {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "sudo commands are using a pty.");
} else {
  security_message(port:0, "sudo commands are not using a pty.");
}
