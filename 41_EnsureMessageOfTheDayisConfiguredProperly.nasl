#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure message of the day (MOTD) is configured properly";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the contents of the /etc/motd file
motd = read_file("/etc/motd");

# Check if the MOTD contains any of the following: \m, \r, \s, \v, or references to the OS platform
if (ereg("(\m|\r|\s|\v|[A-Za-z0-9]+ [A-Za-z0-9]+ [A-Za-z0-9]+ [A-Za-z0-9]+)", motd) == NULL)
{
  security_message(port:port, extra: "Message of the day (MOTD) is configured properly");
}
else
{
  security_warning(port:port, extra: "Message of the day (MOTD) is not configured properly");
}
