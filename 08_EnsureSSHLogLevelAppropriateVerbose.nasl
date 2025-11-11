#!/usr/bin/env nasl

## Ensure SSH LogLevel is appropriate; Verbose

# Read the contents of /etc/ssh/sshd_config
sshd_config = read_file("/etc/ssh/sshd_config");

# Check if the LogLevel directive is set to Verbose
if (!egrep("^LogLevel Verbose", sshd_config))
{
  security_warning(port:0, extra: "SSH LogLevel is not set to Verbose.");
  exit(0);
}

# SSH LogLevel is set to Verbose
exit(1);
