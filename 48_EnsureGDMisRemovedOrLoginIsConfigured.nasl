#!/usr/bin/env nasl

if (!description)
{
  description = "Ensure GDM is removed or login is configured";
}

# Define the target and the port
port = get_kb_item("Host/port");

# Check if GDM is installed
gdm_installed = exec("rpm -q gdm", no_output=TRUE);

# Check if GDM is running
gdm_running = exec("systemctl is-active gdm", no_output=TRUE);

# Check if the login is configured
login_configured = exec("grep -c ^auth.*required.*pam_faillock.so.* /etc/pam.d/system-auth", no_output=TRUE);

# If GDM is installed and running, return a security warning
if (ereg("gdm", gdm_installed) && ereg("active", gdm_running))
{
  security_warning(port:port, extra: "GDM is installed and running");
}

# If GDM is not installed and the login is not configured, return a security warning
if (!ereg("gdm", gdm_installed) && login_configured == "0")
{
  security_warning(port:port, extra: "GDM is not installed and login is not configured");
}

# If GDM is not installed and the login is configured, return a security message
if (!ereg("gdm", gdm_installed) && login_configured != "0")
{
  security_message(port:port, extra: "GDM is not installed and login is configured");
}
