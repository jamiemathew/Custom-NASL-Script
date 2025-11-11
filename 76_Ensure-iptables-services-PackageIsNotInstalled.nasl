#!/usr/bin/nasl

# Check if the iptables-services package is not installed on a RHEL device
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "rpm -qa | grep iptables-services";
    output = exec(cmd);
    if (strlen(output) == 0) {
        security_message(port:0, "The iptables-services package is not installed on the RHEL device");
    } else {
        security_warning(port:0, "The iptables-services package is installed on the RHEL device");
    }
}
