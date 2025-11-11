if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the file information for /etc/crontab
  file_info = get_file_info("/etc/crontab");

  # Check if the owner of the file is root
  if(file_info["owner"] == "root")
  {
    security_note(port: 0, data: "Correct owner for /etc/crontab");
  }
  else
  {
    security_warning(port: 0, data: "Incorrect owner for /etc/crontab");
  }

  # Check if the group owner of the file is root
  if(file_info["group"] == "root")
  {
    security_note(port: 0, data: "Correct group owner for /etc/crontab");
  }
  else
  {
    security_warning(port: 0, data: "Incorrect group owner for /etc/crontab");
  }

  # Check if the file permissions are set to 600
  if(file_info["perm"] == "600")
  {
    security_note(port: 0, data: "Correct permissions for /etc/crontab");
  }
  else
  {
    security_warning(port: 0, data: "Incorrect permissions for /etc/crontab");
  }
}
