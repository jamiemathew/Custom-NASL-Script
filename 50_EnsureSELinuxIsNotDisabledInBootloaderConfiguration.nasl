#!/usr/bin/nasl

if (description)
{
  script_version("1.0");
  script_cvs_date("YYYY/MM/DD");

  script_name("Ensure SELinux is not disabled in bootloader configuration");
  script_summary("Checks if SELinux is not disabled in bootloader configuration");

  exit(0);
}

include("base_include.inc");
include("exec.inc");

flag = 0;

result = exec_bash("grep -i ^selinux /etc/default/grub");

if (result != "") {
  flag = 1;
}

result = exec_bash("grep -i ^selinux /etc/sysconfig/selinux");

if (result != "") {
  flag = 1;
}

if (flag == 1) {
  security_message(port:0, "SELinux is not disabled in bootloader configuration.");
} else {
  security_message(port:0, "SELinux is disabled in bootloader configuration.");
}
