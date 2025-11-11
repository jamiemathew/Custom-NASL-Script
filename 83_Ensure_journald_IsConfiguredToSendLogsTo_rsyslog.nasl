#!/usr/bin/env nasl

# Ensure journald is configured to send logs to rsyslog

# Check if journald is configured to send logs to rsyslog
cmd = "grep '^ForwardToSyslog=yes' /etc/systemd/journald.conf";
output = exec(cmd);

# If journald is not configured to send logs to rsyslog, output will be an empty string
if (output == "") {
  security_warning("Journald is not configured to send logs to rsyslog, which may result in logs not being properly collected and monitored.");
} else {
  security_message("Journald is configured to send logs to rsyslog.");
}
