#!/usr/bin/nasl

# Check separate partition exists for /var in RHEL
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    # Check if /var is mounted
    if (system("grep -q '\\s/var\\s' /proc/mounts") == 0) {
        security_message(port:0, "There is a separate partition for /var in RHEL");
    } else {
        # /var is not mounted as a separate partition
        security_warning(port:0, "There is no separate partition for /var in RHEL");
    }
}
