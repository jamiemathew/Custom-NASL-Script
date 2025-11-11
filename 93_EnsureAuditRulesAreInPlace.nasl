# Check if /etc/audit/audit.rules exists and is not empty
if (is_file("/etc/audit/audit.rules")) {
  if (file_length("/etc/audit/audit.rules") > 0) {
    security_message("Audit rules are in place in /etc/audit/audit.rules.");
    exit(1);
  }
}

# Check if any audit rules are in place in /etc/audit/rules.d/*.rules
files = get_files("/etc/audit/rules.d/*.rules");
if (files && files != make_array()) {
  security_message("Audit rules are in place in /etc/audit/rules.d/*.rules.");
  exit(1);
}

# No audit rules found
security_message("No audit rules are in place.");
exit(0);
