#!/usr/bin/env nasl

## Ensure password hashing algorithm is SHA-512

# Expected password hashing algorithm
expected_algorithm = "sha512";

# Get the password creation policy
password_policy = get_kb_item("Unix/Password_Policy");

# Check if password policy information is available
if (!password_policy)
{
  security_warning(port:0, extra: "Password creation policy information not available.");
  exit(0);
}

# Check if the password hashing algorithm is set to SHA-512
if (password_policy["password_hashing_algorithm"] != expected_algorithm)
{
  security_warning(port:0, extra: "Password hashing algorithm is not set to SHA-512.");
  exit(0);
}

# Password hashing algorithm is set to SHA-512
exit(1);
