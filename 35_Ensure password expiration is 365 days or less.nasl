#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure password expiration is 365 days or less";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the PASS_MAX_DAYS parameter in the /etc/login.defs file
pass_max_days = get_login_defs("PASS_MAX_DAYS");

# Check if the value of PASS_MAX_DAYS is less than or equal to 365
if (pass_max_days <= 365)
{
  security_message(port:port, extra: "Password expiration is set to 365 days or less");
}
else
{
  security_warning(port:port, extra: "Password expiration is not set to 365 days or less");
}
