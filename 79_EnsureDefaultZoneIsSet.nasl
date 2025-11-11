#!/usr/bin/nasl

## Ensure default zone is set for firewalld

## check if the firewalld service is installed
if (!isnull(get_kb_item("Services/firewalld"))) {
  firewalld_status = get_service_status("firewalld");
  if (firewalld_status == 1) {
    ## retrieve the default zone
    cmd = "firewall-cmd --get-default-zone";
    default_zone = trim(exec(cmd));
    if (isnull(default_zone)) {
      security_warning(port:0, "Default zone is not set for firewalld");
    }
  } else {
    security_warning(port:0, "firewalld service is not running");
  }
} else {
  security_warning(port:0, "firewalld service is not installed on the system");
}
