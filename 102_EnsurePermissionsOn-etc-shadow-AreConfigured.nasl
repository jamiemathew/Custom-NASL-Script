# Check if the permissions on the /etc/shadow- file are correctly set
shadow_file = "/etc/shadow-";

if (get_file_permissions(shadow_file) == "600") {
  security_message("Permissions on the /etc/shadow- file are correctly set to allow read and write access for the owner only.");
  exit(1);
} else {
  security_message("Permissions on the /etc/shadow- file are not correctly set to allow read and write access for the owner only.");
  exit(0);
}

