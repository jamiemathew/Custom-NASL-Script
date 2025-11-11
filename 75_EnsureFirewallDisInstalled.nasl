#!/usr/bin/nasl

# Check if FirewallD is installed on a RHEL device
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "systemctl status firewalld";
    output = exec(cmd);
    if (ereg("active", output)) {
        security_message(port:0, "FirewallD is installed and active on the RHEL device");
    } else {
        security_warning(port:0, "FirewallD is not installed or not active on the RHEL device");
    }
}
