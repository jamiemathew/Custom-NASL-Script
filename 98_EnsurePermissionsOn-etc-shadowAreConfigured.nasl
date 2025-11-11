# Check if the permissions on the /etc/shadow file are correctly set
shadow_file = "/etc/shadow";

if (get_file_permissions(shadow_file) == "640") {
  security_message("Permissions on the /etc/shadow file are correctly set to allow read access for the owner and the group owner and write access for the owner only.");
} else {
  security_message("Permissions on the /etc/shadow file are not correctly set to allow read access for the owner and the group owner and write access for the owner only.");
}
exit(0);
