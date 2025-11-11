# Check if authentication is required in single user mode
single_user_auth = exec("grep '^SINGLE' /etc/sysconfig/init");
if (single_user_auth && strstr(single_user_auth, "sulogin")) {
  security_message("Authentication is required in single user mode.");
} else {
  security_message("Authentication is not required in single user mode.");
}
exit(0);
