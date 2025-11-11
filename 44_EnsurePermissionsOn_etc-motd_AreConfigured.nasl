#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure permissions on /etc/motd are configured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the ownership and permissions of the /etc/motd file
motd_perms = get_unix_file_perms("/etc/motd");

# Check if the ownership and permissions of the /etc/motd file are root:root 0644
if (motd_perms == "0644" && get_unix_owner("/etc/motd") == "root" && get_unix_group("/etc/motd") == "root")
{
  security_message(port:port, extra: "Permissions on /etc/motd are configured properly");
}
else
{
  security_warning(port:port, extra: "Permissions on /etc/motd are not configured properly");
}
