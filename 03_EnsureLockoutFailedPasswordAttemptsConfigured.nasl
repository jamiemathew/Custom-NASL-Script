#!/usr/bin/env nasl

## Ensure lockout for failed password attempts is configured

# Maximum number of failed login attempts before lockout
deny = 3;

# Time (in seconds) to unlock the account after lockout
unlock_time = 900;

# Get the password creation policy
password_policy = get_kb_item("Unix/Password_Policy");

# Check if password policy information is available
if (!password_policy)
{
  security_warning(port:0, extra: "Password creation policy information not available.");
  exit(0);
}

# Check if the number of failed login attempts before lockout is set to 3 or greater
if (password_policy["pam_tally2.deny"] < deny)
{
  security_warning(port:0, extra: "Lockout for failed password attempts is not configured.");
  exit(0);
}

# Check if the unlock time is set to 900 seconds or greater
if (password_policy["pam_tally2.unlock_time"] < unlock_time)
{
  security_warning(port:0, extra: "Lockout for failed password attempts is not configured.");
  exit(0);
}

# Lockout for failed password attempts is configured
exit(1);
