# Open /etc/shadow
file = fopen("/etc/shadow", "r");

# Read each line of /etc/shadow
while (line = fgets(file)) {
  # Split the line into fields
  fields = split(line, ":");
  username = fields[0];
  password = fields[1];
  
  # Check if the password field is empty
  if (password == "") {
    security_message("Password for account " + username + " is empty.");
    exit(0);
  }
}
fclose(file);
security_message("All accounts have non-empty passwords.");
exit(1);
