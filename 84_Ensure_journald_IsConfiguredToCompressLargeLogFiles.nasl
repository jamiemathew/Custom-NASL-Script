#!/usr/bin/env nasl

# Ensure journald is configured to compress large log files

# Check if journald is configured to compress large log files
cmd = "grep '^Compress=yes' /etc/systemd/journald.conf";
output = exec(cmd);

# If journald is not configured to compress large log files, output will be an empty string
if (output == "") {
  security_warning("Journald is not configured to compress large log files, which may result in disk usage issues.");
} else {
  security_message("Journald is configured to compress large log files.");
}
