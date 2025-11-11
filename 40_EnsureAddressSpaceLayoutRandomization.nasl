#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure address space layout randomization (ASLR) is enabled";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Get the value of the kernel.randomize_va_space sysctl
randomize_va_space = get_sysctl("kernel.randomize_va_space");

# Check if the value of kernel.randomize_va_space is set to 2
if (randomize_va_space == 2)
{
  security_message(port:port, extra: "Address space layout randomization (ASLR) is enabled");
}
else
{
  security_warning(port:port, extra: "Address space layout randomization (ASLR) is not enabled");
}
