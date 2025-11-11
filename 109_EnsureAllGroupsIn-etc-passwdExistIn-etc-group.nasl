# Store groups in /etc/group in an array
group_file = fopen("/etc/group", "r");
groups = [];
while (group_line = fgets(group_file)) {
  group_fields = split(group_line, ":");
  group_name = group_fields[0];
  groups[group_name] = 1;
}
fclose(group_file);

# Check each group in /etc/passwd
passwd_file = fopen("/etc/passwd", "r");
while (passwd_line = fgets(passwd_file)) {
  passwd_fields = split(passwd_line, ":");
  username = passwd_fields[0];
  gid = passwd_fields[3];
  
  for (i = 0; i < sizeof(groups); i++) {
    if (groups[i] == gid) {
      found = 1;
      break;
    }
  }
  if (!found) {
    security_message("Group " + gid + " for user " + username + " does not exist in /etc/group.");
    exit(0);
  }

}
fclose(passwd_file);
security_message("All groups in /etc/passwd exist in /etc/group.");
exit(1);
