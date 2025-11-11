#!/usr/bin/nasl

# Check nodev option set on /home partition in RHEL
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "grep '\\s/home\\s' /proc/mounts | awk '{print $4}'";
    options = trim(exec(cmd));
    if (ereg("nodev", options)) {
        security_message(port:0, "nodev option is set on /home partition in RHEL");
    } else {
        security_warning(port:0, "nodev option is not set on /home partition in RHEL");
    }
}
