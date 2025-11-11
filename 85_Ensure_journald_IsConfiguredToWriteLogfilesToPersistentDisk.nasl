#!/usr/bin/env nasl

# Ensure journald is configured to write logfiles to persistent disk

# Check if journald is configured to write logfiles to persistent disk
cmd = "grep '^Storage=persistent' /etc/systemd/journald.conf";
output = exec(cmd);

# If journald is not configured to write logfiles to persistent disk, output will be an empty string
if (output == "") {
  security_warning("Journald is not configured to write logfiles to persistent disk, which may result in loss of logs during a reboot.");
} else {
  security_message("Journald is configured to write logfiles to persistent disk.");
}
