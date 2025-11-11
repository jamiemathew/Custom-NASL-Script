#!/usr/bin/nasl

# Check for X11 Server components

# Define the command to list installed packages
cmd = "yum list installed | grep xorg-x11-server";

# Execute the command
res = exec(cmd, safe=True,timeout=30);

# Check if the X11 Server components are installed
if (res["output"]) {
  security_warning(desc: "X11 Server components are installed on the system");
} else {
  security_message(desc: "X11 Server components are not installed on the system");
}
