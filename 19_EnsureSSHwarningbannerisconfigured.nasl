if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the SSH daemon config file
  ssh_config = "/etc/ssh/sshd_config";

  # Check if the "Banner" option is present in the config file
  if(file_exists(ssh_config))
  {
    file = open(ssh_config, "r");
    while(line = file.gets)
    {
      if(ereg("^Banner", line))
      {
        # Split the line into an array
        parts = split(line, " ");

        # Check if the value of "Banner" is set to a file path
        if(parts[1] != "")
        {
          security_note(port: 22, data: "Correct SSH Banner is set in " + ssh_config);
        }
        else
        {
          security_warning(port: 22, data: "Incorrect SSH Banner is set in " + ssh_config);
        }
        break;
      }
    }
    file.close();
  }
}
