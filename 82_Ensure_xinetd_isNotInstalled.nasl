#!/usr/bin/env nasl

# Ensure xinetd is not installed

# Check the output of the rpm command to see if xinetd is installed
cmd = "rpm -q xinetd";
output = exec(cmd);

# If xinetd is not installed, output will be "package xinetd is not installed"
if (egrep("not installed", output) == NULL) {
  security_warning("Xinetd is installed and may be a security risk.");
} else {
  security_message("Xinetd is not installed, no security risk.");
}
