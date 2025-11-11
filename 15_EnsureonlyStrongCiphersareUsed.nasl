if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Get the SSH daemon config file
  ssh_config = "/etc/ssh/sshd_config";

  # Check if the "Ciphers" option is present in the config file
  if(file_exists(ssh_config))
  {
    file = open(ssh_config, "r");
    while(line = file.gets)
    {
      if(ereg("^Ciphers", line))
      {
        # Split the line into an array
        parts = split(line, " ");

        # Check if the value of "Ciphers" includes weak ciphers
        if(ereg("^aes128-ctr,aes192-ctr,aes256-ctr", parts[1]) ||
           ereg("^aes128-cbc,3des-cbc,blowfish-cbc", parts[1]))
        {
          security_warning(port: 22, data: "Weak ciphers are allowed in " + ssh_config);
        }
        else
        {
          security_note(port: 22, data: "Strong ciphers are used in " + ssh_config);
        }
        break;
      }
    }
    file.close();
  }
}
