#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure permissions on /etc/cron.monthly are configured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Define the path to the /etc/cron.monthly directory
cron_monthly = "/etc/cron.monthly";

# Check the file permissions on the directory
if (stat(cron_monthly, "mode") != 16877)
{
  security_warning(port:port, extra: "Incorrect permissions on " + cron_monthly + ": expected 16877, got " + stat(cron_monthly, "mode"));
}
else
{
  security_message(port:port, extra: "Correct permissions on " + cron_monthly);
}
