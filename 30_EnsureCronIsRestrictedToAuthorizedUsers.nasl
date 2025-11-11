#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure cron is restricted to authorized users";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Define the path to the /etc/cron.deny file
cron_deny = "/etc/cron.deny";

# Check if the /etc/cron.deny file exists
if (file_exist(cron_deny))
{
  # Read the contents of the file
  contents = read_file(cron_deny);
  
  # Check if the contents of the file are not empty
  if (contents == "")
  {
    security_warning(port:port, extra: "Empty /etc/cron.deny file");
  }
  else
  {
    security_message(port:port, extra: "Cron is restricted to authorized users");
  }
}
else
{
  security_warning(port:port, extra: "Missing /etc/cron.deny file");
}
