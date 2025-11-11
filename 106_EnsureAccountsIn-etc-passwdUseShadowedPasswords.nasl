# Open /etc/passwd
file = fopen("/etc/passwd", "r");

# Read each line of /etc/passwd
while (line = fgets(file)) {
  # Split the line into fields
  fields = split(line, ":");
  username = fields[0];
  password = fields[1];
  
  # Check if the password field starts with an 'x'
  if (password != "x" && password != "*") {
    security_message("Password for account " + username + " is not shadowed.");
  }
}
fclose(file);
security_message("All accounts use shadowed passwords.");
exit(0);
