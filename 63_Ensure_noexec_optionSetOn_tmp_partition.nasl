#!/usr/bin/nasl

# Check noexec option set on /tmp partition in RHEL
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    # Check if /tmp is mounted
    if (system("grep -q '\\s/tmp\\s' /proc/mounts") == 0) {
        # Get the options for the /tmp partition
        cmd = "grep '\\s/tmp\\s' /proc/mounts | awk '{print $4}'";
        options = trim(exec(cmd));
        if (search("noexec", options) == -1) {
            # noexec option is not set for /tmp
            security_warning(port:0, "The noexec option is not set on the /tmp partition in RHEL");
        } else {
            # noexec option is set for /tmp
            security_message(port:0, "The noexec option is set on the /tmp partition in RHEL");
        }
    }
}
