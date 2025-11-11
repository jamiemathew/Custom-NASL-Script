if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the SSH daemon config file
  ssh_config = "/etc/ssh/sshd_config";

  # Check if the "KexAlgorithms" option is present in the config file
  if(file_exists(ssh_config))
  {
    file = open(ssh_config, "r");
    while(line = file.gets)
    {
      if(ereg("^KexAlgorithms", line))
      {
        # Split the line into an array
        parts = split(line, " ");

        # Check if the value of "KexAlgorithms" includes weak key exchange algorithms
        if(ereg("^diffie-hellman-group1-sha1", parts[1]))
        {
          security_warning(port: 22, data: "Weak key exchange algorithms are allowed in " + ssh_config);
        }
        else
        {
          security_note(port: 22, data: "Strong key exchange algorithms are used in " + ssh_config);
        }
        break;
      }
    }
    file.close();
  }
}
