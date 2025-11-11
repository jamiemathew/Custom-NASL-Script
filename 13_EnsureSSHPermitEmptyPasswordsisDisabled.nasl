#!/usr/bin/env nasl

if (description)
{
  script_id(999999);
  script_version("1.0");
  script_cve_id("N/A");
  script_bugtraq_id(00000);
  script_xref(name:"MIL", value:"MIL-99999-9999");
  script_name("Ensure SSH PermitEmptyPasswords is disabled");
  script_summary("This script checks the value of the PermitEmptyPasswords parameter in the SSH configuration file (/etc/ssh/sshd_config) and ensures that it is set to 'no' to disable SSH login with empty passwords.");

  family("Red Hat Enterprise Linux");

  return;
}

include("ssh_func.inc");

if (!is_ssh_running()) {
  exit(0, "SSH service is not running.");
}

if (get_sshd_config_value("PermitEmptyPasswords") != "no") {
  exit(1, "SSH login with empty passwords is enabled. Please set PermitEmptyPasswords to 'no' in the SSH configuration file (/etc/ssh/sshd_config) to disable SSH login with empty passwords.");
}

exit(0, "SSH login with empty passwords is disabled as expected.");
