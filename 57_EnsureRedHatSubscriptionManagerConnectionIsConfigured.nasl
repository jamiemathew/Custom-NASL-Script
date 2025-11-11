#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure Red Hat Subscription Manager connection is configured");
  script_summary("Checks if the Red Hat Subscription Manager connection is configured");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("subscription-manager identity");

if (result =~ "Current identity is") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "Red Hat Subscription Manager connection is configured.");
} else {
  security_message(port:0, "Red Hat Subscription Manager connection is not configured.");
}
