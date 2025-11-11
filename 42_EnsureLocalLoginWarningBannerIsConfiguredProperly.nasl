#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure local login warning banner is configured properly";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the contents of the /etc/issue file
issue = read_file("/etc/issue");

# Check if the /etc/issue file is properly configured
if (ereg("^(Authorized use only.+|This system is for the use of authorized users only.+)$", issue) != NULL)
{
  security_message(port:port, extra: "Local login warning banner is configured properly");
}
else
{
  security_warning(port:port, extra: "Local login warning banner is not configured properly");
}
