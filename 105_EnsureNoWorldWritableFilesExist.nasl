# Check if there are any world-writable files
files = get_files("/", follow_symlinks:TRUE);

for (file in files) {
  if (get_file_permissions(file) =~ "^[0-7][0-7][7]") {
    security_message("World-writable file found: " + file);
  }
}
security_message("No world-writable files found.");
exit(0);
