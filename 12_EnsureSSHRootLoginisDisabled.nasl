#!/usr/bin/env nasl

if (description)
{
  script_id(999999);
  script_version("1.0");
  script_cve_id("N/A");
  script_bugtraq_id(00000);
  script_xref(name:"MIL", value:"MIL-99999-9999");
  script_name("Ensure SSH root login is disabled");
  script_summary("This script checks the value of the PermitRootLogin parameter in the SSH configuration file (/etc/ssh/sshd_config) and ensures that it is set to 'no' to disable root login via SSH.");

  family("Red Hat Enterprise Linux");

  return;
}

include("ssh_func.inc");

if (!is_ssh_running()) {
  exit(0, "SSH service is not running.");
}

if (get_sshd_config_value("PermitRootLogin") != "no") {
  exit(1, "Root login via SSH is enabled. Please set PermitRootLogin to 'no' in the SSH configuration file (/etc/ssh/sshd_config) to disable root login via SSH.");
}

exit(0, "Root login via SSH is disabled as expected.");
