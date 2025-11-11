#!/usr/bin/nasl

## Ensure firewalld service is enabled and running

## check if the firewalld service is installed
if (!isnull(get_kb_item("Services/firewalld"))) {
  firewalld_status = get_service_status("firewalld");
  if (firewalld_status == -1) {
    security_warning(port:0, "firewalld service is not installed on the system");
  } else {
    if (firewalld_status != 1) {
      security_warning(port:0, "firewalld service is not running");
    }
    ## check if the firewalld service is enabled
    if (!is_service_enabled("firewalld")) {
      security_warning(port:0, "firewalld service is not enabled");
    }
  }
} else {
  security_warning(port:0, "firewalld service is not installed on the system");
}
