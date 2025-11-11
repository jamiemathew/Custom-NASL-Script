#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure updates, patches, and additional security software are installed";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Use the rpm command to list all installed packages
installed_packages = exec("rpm -qa", no_output=TRUE);

# Define an array of packages that should be installed
required_packages = [
  "kernel-headers",
  "kernel-tools",
  "glibc",
  "gcc",
  "binutils",
  "make",
  "security-policy"
];

# Check if each required package is installed
for (package in required_packages)
{
  if (ereg(package, installed_packages))
  {
    security_message(port:port, extra: "Required package " + package + " is installed");
  }
  else
  {
    security_warning(port:port, extra: "Required package " + package + " is not installed");
  }
}
