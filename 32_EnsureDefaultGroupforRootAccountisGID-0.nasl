#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure default group for the root account is GID 0";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the GID of the root account
gid = get_user_info("root", "gid");

# Check if the GID of the root account is 0
if (gid == 0)
{
  security_message(port:port, extra: "The default group for the root account is GID 0");
}
else
{
  security_warning(port:port, extra: "The default group for the root account is not GID 0");
}
