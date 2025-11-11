#!/usr/bin/env nasl

# Ensure permissions on all logfiles are configured

# Define the desired permissions for logfiles
desired_perms = "0640";

# Get a list of all logfiles
cmd = "find /var/log -type f";
logfiles = split(exec(cmd), "\n");

# Loop through the list of logfiles
for (i = 0; i < sizeof(logfiles); i++) {
  # Get the permissions of the current logfile
  cmd = "stat -c '%a' " + logfiles[i];
  perms = exec(cmd);

  # Compare the current logfile's permissions to the desired permissions
  if (perms != desired_perms) {
    security_warning(logfiles[i] + " has incorrect permissions. Desired: " + desired_perms + " Found: " + perms);
  }
}

security_message("All logfiles have the correct permissions.");
