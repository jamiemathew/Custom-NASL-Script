# Check if the permissions on the /etc/passwd- file are correctly set
passwd_file = "/etc/passwd-";

if (get_file_permissions(passwd_file) == "600") {
  security_message("Permissions on the /etc/passwd- file are correctly set to allow read and write access for the owner only.");
  exit(1);
} else {
  security_message("Permissions on the /etc/passwd- file are not correctly set to allow read and write access for the owner only.");
  exit(0);
}

