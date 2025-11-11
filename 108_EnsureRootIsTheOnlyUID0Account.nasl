# Open /etc/passwd
file = fopen("/etc/passwd", "r");

# Read each line of /etc/passwd
while (line = fgets(file)) {
  # Split the line into fields
  fields = split(line, ":");
  username = fields[0];
  uid = fields[2];
  
  # Check if the UID is 0 and the username is not root
  if (uid == "0" && username != "root") {
    security_message("Account " + username + " has UID 0.");
    exit(0);
  }
}
fclose(file);
security_message("Root is the only account with UID 0.");
exit(1);
