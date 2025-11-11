#!/usr/bin/env nasl

## Ensure SSH MaxAuthTries is set to 4 or less

# Read the contents of /etc/ssh/sshd_config
sshd_config = read_file("/etc/ssh/sshd_config");

# Check if the MaxAuthTries directive is set to 4 or less
if (!egrep("^MaxAuthTries [0-4]", sshd_config))
{
  security_warning(port:0, extra: "SSH MaxAuthTries is not set to 4 or less.");
  exit(0);
}

# SSH MaxAuthTries is set to 4 or less
exit(1);
