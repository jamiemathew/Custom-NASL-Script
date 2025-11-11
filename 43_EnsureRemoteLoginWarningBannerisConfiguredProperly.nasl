#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure remote login warning banner is configured properly";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the contents of the /etc/issue.net file
issue_net = read_file("/etc/issue.net");

# Check if the /etc/issue.net file is properly configured
if (ereg("^(Authorized use only.+|This system is for the use of authorized users only.+)$", issue_net) != NULL)
{
  security_message(port:port, extra: "Remote login warning banner is configured properly");
}
else
{
  security_warning(port:port, extra: "Remote login warning banner is not configured properly");
}
