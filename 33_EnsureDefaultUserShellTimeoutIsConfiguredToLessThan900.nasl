#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure default user shell timeout is configured to be less than 900";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the TMOUT environment variable
tmout = get_kb_item("Env/TMOUT");

# Check if the value of the TMOUT environment variable is less than 900
if (tmout < 900)
{
  security_message(port:port, extra: "The default user shell timeout is configured to be less than 900 seconds");
}
else
{
  security_warning(port:port, extra: "The default user shell timeout is not configured to be less than 900 seconds");
}
