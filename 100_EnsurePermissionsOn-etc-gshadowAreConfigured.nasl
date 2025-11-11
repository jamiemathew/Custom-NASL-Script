# Check if the permissions on the /etc/gshadow file are correctly set
gshadow_file = "/etc/gshadow";

if (get_file_permissions(gshadow_file) == "640") {
  security_message("Permissions on the /etc/gshadow file are correctly set to allow read access for the owner and the group owner and write access for the owner only.");
  exit(1);
} else {
  security_message("Permissions on the /etc/gshadow file are not correctly set to allow read access for the owner and the group owner and write access for the owner only.");
  exit(0);
}

