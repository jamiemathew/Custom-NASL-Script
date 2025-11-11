#!/usr/bin/env nasl

## Ensure permissions on /etc/ssh/sshd_config are configured

# Expected permissions for /etc/ssh/sshd_config
expected_permissions = "644";

# Get the permissions of /etc/ssh/sshd_config
permissions = get_unix_permissions("/etc/ssh/sshd_config");

# Check if the permissions are set correctly
if (permissions != expected_permissions)
{
  security_warning(port:0, extra: "Permissions on /etc/ssh/sshd_config are not configured correctly.");
  exit(0);
}

# Permissions on /etc/ssh/sshd_config are configured correctly
exit(1);
