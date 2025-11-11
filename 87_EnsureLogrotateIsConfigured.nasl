#!/usr/bin/nasl

# Check if logrotate is installed
if ( ! get_kb_item("System/Logrotate/installed") ) {
  security_warning(port:0, "logrotate package not installed on the system");
}
else {
  # Check if logrotate configuration file exists
  logrotate_conf = "/etc/logrotate.conf";
  if ( ! is_file(logrotate_conf) ) {
    security_warning(port:0, "logrotate configuration file not found at " + logrotate_conf);
  }
  else {
    # Check if logrotate is configured properly
    if ( ! grep(pattern: "^[^#].*", string: read_file(logrotate_conf)) ) {
      security_warning(port:0, "logrotate configuration file is empty or not properly configured");
    }
  }
}
