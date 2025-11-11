if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the file information for /etc/cron.hourly
  file_info = get_file_info("/etc/cron.hourly");

  # Check if the owner of the file is root
  if(file_info["owner"] == "root")
  {
    security_note(port: 0, data: "Correct owner for /etc/cron.hourly");
  }
  else
  {
    security_warning(port: 0, data: "Incorrect owner for /etc/cron.hourly");
  }

  # Check if the group owner of the file is root
  if(file_info["group"] == "root")
  {
    security_note(port: 0, data: "Correct group owner for /etc/cron.hourly");
  }
  else
  {
    security_warning(port: 0, data: "Incorrect group owner for /etc/cron.hourly");
  }

  # Check if the file permissions are set to 700
  if(file_info["perm"] == "700")
  {
    security_note(port: 0, data: "Correct permissions for /etc/cron.hourly");
  }
  else
  {
    security_warning(port: 0, data: "Incorrect permissions for /etc/cron.hourly");
  }
}
