#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure password expiration warning days is 7 or more";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the PASS_WARN_AGE parameter in the /etc/login.defs file
pass_warn_age = get_login_defs("PASS_WARN_AGE");

# Check if the value of PASS_WARN_AGE is greater than or equal to 7
if (pass_warn_age >= 7)
{
  security_message(port:port, extra: "Password expiration warning days is set to 7 or more");
}
else
{
  security_warning(port:port, extra: "Password expiration warning days is not set to 7 or more");
}
