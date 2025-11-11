#!/usr/bin/nasl

# Check separate partition exists for /home in RHEL
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "grep '\\s/home\\s' /proc/mounts";
    output = exec(cmd);
    if (output) {
        security_message(port:0, "A separate partition exists for /home in RHEL");
    } else {
        security_warning(port:0, "No separate partition exists for /home in RHEL");
    }
}
