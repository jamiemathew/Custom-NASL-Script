#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure system accounts are secured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Define a list of system account usernames
system_accounts = ["bin", "daemon", "adm", "lp", "sync", "shutdown", "halt", "mail", "news", "uucp", "operator", "games", "gopher", "ftp", "nobody", "root", "systemd-network", "systemd-resolve", "dbus", "tss", "postfix", "chrony", "systemd-bus-proxy", "systemd-journal-gateway", "systemd-journal-remote", "systemd-timesync", "tcpdump"];

# Loop through the list of system accounts
foreach account (system_accounts)
{
  # Check if the account has a password set
  if (get_user_info(account, "pwd"))
  {
    security_warning(port:port, extra: "Password set for system account " + account);
  }
  else
  {
    security_message(port:port, extra: "No password set for system account " + account);
  }
  
  # Check if the account has a valid shell
  if (get_user_info(account, "shell") != "/sbin/nologin" && get_user_info(account, "shell") != "/bin/false")
  {
    security_warning(port:port, extra: "Invalid shell set for system account " + account);
  }
  else
  {
    security_message(port:port, extra: "Valid shell set for system account " + account);
  }
}
