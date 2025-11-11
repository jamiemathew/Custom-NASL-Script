#!/usr/bin/nasl

# Check if the nftables package is not installed or stopped and masked on a RHEL device
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "systemctl is-enabled nftables.service";
    output = exec(cmd);

    if (strstr(output, "enabled") != -1) {
        security_warning(port:0, "The nftables service is enabled on the RHEL device");
    } else if (strstr(output, "disabled") != -1) {
        cmd = "systemctl is-active nftables.service";
        output = exec(cmd);
        if (strstr(output, "active") != -1) {
            security_warning(port:0, "The nftables service is active on the RHEL device");
        } else {
            security_message(port:0, "The nftables package is not installed or stopped and masked on the RHEL device");
        }
    }
}
