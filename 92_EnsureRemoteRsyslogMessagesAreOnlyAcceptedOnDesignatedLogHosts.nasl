#!/usr/bin/env nasl

# Define the target host
host = get_host_ip();

# Check the presence of the rsyslog configuration file
if (file_exist("/etc/rsyslog.conf")) {
  # Read the contents of the rsyslog configuration file
  contents = read_file("/etc/rsyslog.conf");

  # Check if the $ModLoad imtcp module is loaded
  if (ereg("^$ModLoad[[:space:]]+imtcp", contents)) {
    # Check if the $InputTCPServerRun line is present and contains a list of IP addresses
    if (ereg("^$InputTCPServerRun[[:space:]]+([0-9]+(\.[0-9]+){3}(,[0-9]+(\.[0-9]+){3})*)", contents)) {
      # Extract the list of IP addresses
      ip_list = ereg_replace("^$InputTCPServerRun[[:space:]]+", "", ereg_match("^$InputTCPServerRun[[:space:]]+([0-9]+(\.[0-9]+){3}(,[0-9]+(\.[0-9]+){3})*)", contents));

      # Split the list of IP addresses into an array
      ip_array = split(ip_list, ",");

      # Check if the target host's IP address is in the list of IP addresses
      if (index(ip_array, host) >= 0) {
        security_message(port: 514, data: "Remote syslog messages are only accepted on designated log hosts");
      } else {
        security_message(port: 514, data: "Remote syslog messages are not restricted to designated log hosts");
      }
    } else {
      security_message(port: 514, data: "The $InputTCPServerRun line is not configured to accept connections from designated log hosts only");
    }
  } else {
    security_message(port: 514, data: "The imtcp module is not loaded, remote syslog messages are not being accepted");
  }
} else {
  security_message(port: 514, data: "The rsyslog configuration file is not present");
}

