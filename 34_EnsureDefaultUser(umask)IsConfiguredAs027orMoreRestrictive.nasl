#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure default user umask is configured as 027 or more restrictive";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the umask shell built-in command
umask_value = exec("umask", "", 1);

# Convert the umask value from octal to decimal
umask_decimal = octal_to_decimal(umask_value);

# Check if the umask value is 027 or more restrictive
if (umask_decimal <= 0027)
{
  security_message(port:port, extra: "The default user umask is configured as 027 or more restrictive");
}
else
{
  security_warning(port:port, extra: "The default user umask is not configured as 027 or more restrictive");
}
