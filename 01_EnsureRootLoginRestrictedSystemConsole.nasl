#!/usr/bin/env nasl

## Ensure root login is restricted to system console on RHEL OS

# Check if the file /etc/securetty exists
if( !get_kb_item("Unix/File_Permissions/etc/securetty") ) exit(0);

# Get the contents of the file
securetty = read_file("/etc/securetty");

# Check if the file is empty or does not contain "console"
if( !securetty || !egrep("^console$", securetty) )
{
  security_warning(port:0, extra: "Root login is not restricted to system console on RHEL OS.");
  exit(0);
}

# Root login is restricted to system console on RHEL OS
exit(1);
