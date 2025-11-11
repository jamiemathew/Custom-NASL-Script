#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure package manager repositories are configured");
  script_summary("Checks if package manager repositories are properly configured");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("yum repolist");

if (result =~ "repo id") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "Package manager repositories are properly configured.");
} else {
  security_message(port:0, "Package manager repositories are not properly configured.");
}
