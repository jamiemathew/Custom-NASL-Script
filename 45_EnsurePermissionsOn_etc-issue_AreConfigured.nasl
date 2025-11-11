#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure permissions on /etc/issue are configured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the ownership and permissions of the /etc/issue file
issue_perms = get_unix_file_perms("/etc/issue");

# Check if the ownership and permissions of the /etc/issue file are root:root 0644
if (issue_perms == "0644" && get_unix_owner("/etc/issue") == "root" && get_unix_group("/etc/issue") == "root")
{
  security_message(port:port, extra: "Permissions on /etc/issue are configured properly");
}
else
{
  security_warning(port:port, extra: "Permissions on /etc/issue are not configured properly");
}
