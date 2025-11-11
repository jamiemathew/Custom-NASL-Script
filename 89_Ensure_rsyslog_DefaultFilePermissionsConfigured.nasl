# Define the expected value for the $FileCreateMode parameter
expected_mode = "0640";

# Get the path to the rsyslog configuration file
rsyslog_conf = nessus_get_rpminfo_file("rsyslog", "rsyslog.conf");

# Check if the file exists
if (nessus_file_exists(rsyslog_conf)) {
  # Check if the $FileCreateMode parameter is specified in the configuration file
  if (nessus_search_file(rsyslog_conf, "$FileCreateMode " + expected_mode)) {
    security_message(SECURITY_PASS, "The $FileCreateMode parameter is set to the expected value in the rsyslog configuration file.");
  } else {
    security_message(SECURITY_WARNING, "The $FileCreateMode parameter is not set to the expected value in the rsyslog configuration file.");
  }
} else {
  security_message(SECURITY_WARNING, "The rsyslog configuration file does not exist.");
}
