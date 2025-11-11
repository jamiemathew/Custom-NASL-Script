# Check if the permissions on the /etc/gshadow- file are correctly set
gshadow_file = "/etc/gshadow-";

if (get_file_permissions(gshadow_file) == "600") {
  security_message("Permissions on the /etc/gshadow- file are correctly set to allow read and write access for the owner only.");
} else {
  security_message("Permissions on the /etc/gshadow- file are not correctly set to allow read and write access for the owner only.");
}
exit(0);
