if (nessus_check_rpminfo("rsyslog")) {
  # Check if rsyslog service is enabled
  if (nessus_check_service_enabled("rsyslog")) {
    # Check if rsyslog service is running
    if (nessus_check_service("rsyslog", "running")) {
      security_message(SECURITY_PASS, "rsyslog service is enabled and running.");
    } else {
      security_message(SECURITY_WARNING, "rsyslog service is enabled but not running.");
    }
  } else {
    security_message(SECURITY_WARNING, "rsyslog service is not enabled.");
  }
} else {
  security_message(SECURITY_WARNING, "rsyslog package is not installed.");
}
