if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the SSH daemon config file
  ssh_config = "/etc/ssh/sshd_config";

  # Check if the "LoginGraceTime" option is present in the config file
  if(file_exists(ssh_config))
  {
    file = open(ssh_config, "r");
    while(line = file.gets)
    {
      if(ereg("^LoginGraceTime", line))
      {
        # Split the line into an array
        parts = split(line, " ");

        # Check if the value of "LoginGraceTime" is one (1) minute or less
        if(parts[1] <= 60)
        {
          security_note(port: 22, data: "Correct SSH LoginGraceTime is set in " + ssh_config);
        }
        else
        {
          security_warning(port: 22, data: "Incorrect SSH LoginGraceTime is set in " + ssh_config);
        }
        break;
      }
    }
    file.close();
  }
}
