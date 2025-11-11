#!/usr/bin/env nasl

# NASL script to disable SSH host-based authentication on RHEL

if (!get_kb_item("Host/local_checks_enabled"))
    exit(0);

if (!get_kb_item("OS/Linux"))
    exit(0);

# Check if the system is running RHEL
os = get_kb_item("OS/name");
if (os != "Red Hat Enterprise Linux")
    exit(0);

# Check if SSH is installed
if (!get_kb_item("Services/ssh"))
    exit(0);

# Check if host-based authentication is enabled
ssh_config = open("/etc/ssh/sshd_config", "r");
hostbased_auth = false;
while (line = ssh_config.read_line()) {
    if (line =~ "^HostbasedAuthentication yes") {
        hostbased_auth = true;
        break;
    }
}
ssh_config.close();

# If host-based authentication is enabled, disable it
if (hostbased_auth) {
    ssh_config = open("/etc/ssh/sshd_config", "a");
    ssh_config.write("\nHostbasedAuthentication no\n");
    ssh_config.close();
    security_message("SSH host-based authentication has been disabled");
}

exit(0);
