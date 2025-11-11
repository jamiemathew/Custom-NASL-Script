#!/usr/bin/nasl

# Ensure separate partition exists for /var/tmp in RHEL
if (is_linux() && get_kb_item("Host/OS/redhat") == "Red Hat Enterprise Linux") {
    cmd = "df -h | grep '/var/tmp\\s'";
    var_tmp_partition = exec(cmd);
    if (var_tmp_partition == "") {
        # No separate partition exists for /var/tmp
        # Error message
        security_message("A separate partition does not exist for /var/tmp. This can lead to stability issues when /var/tmp grows and consumes all the available disk space.");
    }
    else {
        security_message("separate partition exists for /var/tmp in RHEL");   
    }
}
