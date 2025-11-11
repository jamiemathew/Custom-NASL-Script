#!/usr/bin/env nasl

## Ensure password reuse is limited to 5 or more

# Minimum number of unique passwords required
min_unique_passwords = 5;

# Get the password creation policy
password_policy = get_kb_item("Unix/Password_Policy");

# Check if password policy information is available
if (!password_policy)
{
  security_warning(port:0, extra: "Password creation policy information not available.");
  exit(0);
}

# Check if password reuse is limited to 5 or more
if (password_policy["password_reuse_limit"] < min_unique_passwords)
{
  security_warning(port:0, extra: "Password reuse is not limited to 5 or more.");
  exit(0);
}

# Password reuse is limited to 5 or more
exit(1);
