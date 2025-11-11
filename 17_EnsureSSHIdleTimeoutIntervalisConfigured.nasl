if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the SSH daemon config file
  ssh_config = "/etc/ssh/sshd_config";

  # Check if the "ClientAliveInterval" and "ClientAliveCountMax" options are present in the config file
  if(file_exists(ssh_config))
  {
    client_alive_interval = 0;
    client_alive_count_max = 0;

    file = open(ssh_config, "r");
    while(line = file.gets)
    {
      if(ereg("^ClientAliveInterval", line))
      {
        # Split the line into an array
        parts = split(line, " ");
        client_alive_interval = parts[1];
      }
      if(ereg("^ClientAliveCountMax", line))
      {
        # Split the line into an array
        parts = split(line, " ");
        client_alive_count_max = parts[1];
      }
    }
    file.close();

    # Check if the values of "ClientAliveInterval" and "ClientAliveCountMax" are set as required
    if(client_alive_interval == 300 && client_alive_count_max == 3)
    {
      security_note(port: 22, data: "Correct SSH idle timeout interval is configured in " + ssh_config);
    }
    else
    {
      security_warning(port: 22, data: "Incorrect SSH idle timeout interval is configured in " + ssh_config);
    }
  }
}
