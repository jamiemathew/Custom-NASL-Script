# Check if the boot loader config file has proper permissions
boot_loader_config_file = "/boot/grub2/grub.cfg";

if (get_file_permissions(boot_loader_config_file) == "600") {
  security_message("Permissions on the boot loader config file are correctly set to allow read and write access to the root user only.");
} else {
  security_message("Permissions on the boot loader config file are not correctly set to allow read and write access to the root user only.");
}
exit(0);
