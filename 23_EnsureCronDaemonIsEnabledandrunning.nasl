if(nessus_os_family() == "Red Hat Enterprise Linux")
{
  # Check if the cron daemon is enabled
  cron_enabled = service_check_enabled("crond");
  if(cron_enabled)
  {
    security_note(port: 0, data: "Cron daemon is enabled");
  }
  else
  {
    security_warning(port: 0, data: "Cron daemon is not enabled");
  }

  # Check if the cron daemon is running
  cron_running = service_check_running("crond");
  if(cron_running)
  {
    security_note(port: 0, data: "Cron daemon is running");
  }
  else
  {
    security_warning(port: 0, data: "Cron daemon is not running");
  }
}
