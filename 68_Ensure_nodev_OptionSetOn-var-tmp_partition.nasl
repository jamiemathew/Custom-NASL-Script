#!/usr/bin/nasl

# Check nodev option set on /var/tmp partition in RHEL
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "grep '\\s/var/tmp\\s' /proc/mounts | awk '{print $4}'";
    options = trim(exec(cmd));
    if (options && match(options, "nodev")) {
        security_message(port:0, "nodev option is set on /var/tmp partition in RHEL");
    } else {
        security_warning(port:0, "nodev option is not set on /var/tmp partition in RHEL");
    }
}
