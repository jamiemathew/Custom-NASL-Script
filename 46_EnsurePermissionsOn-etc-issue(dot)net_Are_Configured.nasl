#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure permissions on /etc/issue.net are configured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the ownership and permissions of the /etc/issue.net file
issue_net_perms = get_unix_file_perms("/etc/issue.net");

# Check if the ownership and permissions of the /etc/issue.net file are root:root 0644
if (issue_net_perms == "0644" && get_unix_owner("/etc/issue.net") == "root" && get_unix_group("/etc/issue.net") == "root")
{
  security_message(port:port, extra: "Permissions on /etc/issue.net are configured properly");
}
else
{
  security_warning(port:port, extra: "Permissions on /etc/issue.net are not configured properly");
}
