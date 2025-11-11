#!/usr/bin/nasl

## Ensure network interfaces are assigned to appropriate zone

## check if the firewalld service is installed
if (!isnull(get_kb_item("Services/firewalld"))) {
  firewalld_status = get_service_status("firewalld");
  if (firewalld_status == 1) {
    ## retrieve the list of active zones
    cmd = "firewall-cmd --get-active-zones";
    active_zones = trim(exec(cmd));
    if (!isnull(active_zones)) {
      ## retrieve the list of network interfaces
      cmd = "ip addr show | grep 'state UP' | awk '{print $2}'";
      interfaces = split(exec(cmd), "\n");
      ## check if each network interface is assigned to a zone
      for (interface in interfaces) {
        cmd = "firewall-cmd --zone=" + interface + " --query-interface=" + interface;
        zone = trim(exec(cmd));
        if (isnull(zone)) {
          security_warning(port:0, "network interface " + interface + " is not assigned to a zone");
        }
      }
    } else {
      security_warning(port:0, "No active zones found for firewalld");
    }
  } else {
    security_warning(port:0, "firewalld service is not running");
  }
} else {
  security_warning(port:0, "firewalld service is not installed on the system");
}
