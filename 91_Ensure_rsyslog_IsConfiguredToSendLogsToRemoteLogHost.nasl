# Define the expected remote log host
expected_host = "10.0.0.1";

# Get the path to the rsyslog configuration file
rsyslog_conf = nessus_get_rpminfo_file("rsyslog", "rsyslog.conf");

# Check if the file exists
if (nessus_file_exists(rsyslog_conf)) {
  # Check if the remote log host is specified in the configuration file
  if (nessus_search_file(rsyslog_conf, "*.* @" + expected_host)) {
    security_message(SECURITY_PASS, "rsyslog is configured to send logs to the expected remote log host.");
  } else {
    security_message(SECURITY_WARNING, "rsyslog is not configured to send logs to the expected remote log host.");
  }
} else {
  security_message(SECURITY_WARNING, "The rsyslog configuration file does not exist.");
}
