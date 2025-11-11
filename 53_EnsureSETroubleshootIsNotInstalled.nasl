#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure SETroubleshoot is not installed");
  script_summary("Checks if SETroubleshoot is not installed");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("rpm -q setroubleshoot");

if (result =~ "package setroubleshoot is not installed") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "SETroubleshoot is not installed.");
} else {
  security_message(port:0, "SETroubleshoot is installed.");
}
