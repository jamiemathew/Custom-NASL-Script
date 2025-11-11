#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure inactive password lock is 30 days or less";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the INACTIVE parameter in the /etc/default/useradd file
inactive = get_useradd_param("INACTIVE");

# Check if the value of INACTIVE is less than or equal to 30
if (inactive <= 30)
{
  security_message(port:port, extra: "Inactive password lock is set to 30 days or less");
}
else
{
  security_warning(port:port, extra: "Inactive password lock is not set to 30 days or less");
}
