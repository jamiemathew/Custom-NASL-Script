#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure core dumps are restricted";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the hard core limit in the /etc/security/limits.conf file
hard_core_limit = get_limits_conf("*", "hard", "core");

# Check if the hard core limit is set to 0
if (hard_core_limit == 0)
{
  security_message(port:port, extra: "Core dumps are restricted");
}
else
{
  security_warning(port:port, extra: "Core dumps are not restricted");
}
