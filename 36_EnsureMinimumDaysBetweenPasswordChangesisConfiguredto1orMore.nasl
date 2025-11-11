#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure minimum days between password changes is configured to be 1 or more";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the PASS_MIN_DAYS parameter in the /etc/login.defs file
pass_min_days = get_login_defs("PASS_MIN_DAYS");

# Check if the value of PASS_MIN_DAYS is greater than or equal to 1
if (pass_min_days >= 1)
{
  security_message(port:port, extra: "Minimum days between password changes is set to 1 or more");
}
else
{
  security_warning(port:port, extra: "Minimum days between password changes is not set to 1 or more");
}
