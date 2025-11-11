#!/usr/bin/env nasl

## Ensure password creation requirements are configured

# Minimum password length
minlen = 10;

# Minimum password complexity (number of character classes)
minclass = 4;

# Get the password creation policy
password_policy = get_kb_item("Unix/Password_Policy");

# Check if password policy information is available
if (!password_policy)
{
  security_warning(port:0, extra: "Password creation policy information not available.");
  exit(0);
}

# Check if minimum password length is set to 10 or greater
if (password_policy["pam_pwquality.minlen"] < minlen)
{
  security_warning(port:0, extra: "Minimum password length is not set to 10 or greater.");
  exit(0);
}

# Check if minimum password complexity is set to 4 or greater
if (password_policy["pam_pwquality.minclass"] < minclass)
{
  security_warning(port:0, extra: "Minimum password complexity is not set to 4 or greater.");
  exit(0);
}

# Password creation requirements are configured
exit(1);
