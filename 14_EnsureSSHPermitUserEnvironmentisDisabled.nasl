if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the SSH daemon config file
  ssh_config = "/etc/ssh/sshd_config";

  # Check if the "PermitUserEnvironment" option is present in the config file
  if(file_exists(ssh_config))
  {
    file = open(ssh_config, "r");
    while(line = file.gets)
    {
      if(ereg("^PermitUserEnvironment", line))
      {
        # Split the line into an array
        parts = split(line, " ");

        # Check if the value of "PermitUserEnvironment" is set to "yes"
        if(parts[1] == "yes")
        {
          security_warning(port: 22, data: "PermitUserEnvironment is enabled in " + ssh_config);
        }
        else
        {
          security_note(port: 22, data: "PermitUserEnvironment is disabled in " + ssh_config);
        }
        break;
      }
    }
    file.close();
  }
}
