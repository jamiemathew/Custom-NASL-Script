#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure GPG keys are configured");
  script_summary("Checks if GPG keys are properly configured");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("gpg --list-keys");

if (result =~ "pub") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "GPG keys are properly configured.");
} else {
  security_message(port:0, "GPG keys are not properly configured.");
}
