#!/usr/bin/env nasl

## Ensure SSH access is limited

# Read the contents of /etc/ssh/sshd_config
sshd_config = read_file("/etc/ssh/sshd_config");

# Check if the AllowUsers directive is present and contains at least one user
if (!egrep("^AllowUsers .*", sshd_config))
{
  security_warning(port:0, extra: "SSH access is not limited.");
  exit(0);
}

# SSH access is limited
exit(1);
