#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure permissions on /etc/cron.d are configured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Define the path to the /etc/cron.d directory
cron_d = "/etc/cron.d";

# Check the file permissions on the directory
if (stat(cron_d, "mode") != 16877)
{
  security_warning(port:port, extra: "Incorrect permissions on " + cron_d + ": expected 16877, got " + stat(cron_d, "mode"));
}
else
{
  security_message(port:port, extra: "Correct permissions on " + cron_d);
}
