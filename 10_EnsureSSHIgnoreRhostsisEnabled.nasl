#!/usr/bin/env nasl

## Ensure SSH IgnoreRhosts is enabled

# Read the contents of /etc/ssh/sshd_config
sshd_config = read_file("/etc/ssh/sshd_config");

# Check if the IgnoreRhosts directive is set to yes
if (!egrep("^IgnoreRhosts yes", sshd_config))
{
  security_warning(port:0, extra: "SSH IgnoreRhosts is not enabled.");
  exit(0);
}

# SSH IgnoreRhosts is enabled
exit(1);
