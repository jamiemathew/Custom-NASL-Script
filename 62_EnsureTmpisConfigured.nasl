#!/usr/bin/env nasl

if(description)
{
  script_version("1.0");
  script_cve_id("");
  script_bugtraq_id(0);
  script_xref(name:"");
  script_name("Check for Proper Configuration of /tmp");
  script_summary("Ensures that /tmp is properly configured");
  script_category(ACT_GATHER_INFO);
  script_family("");
  script_copyright("");
  script_dependencies("");
  script_require_keys("");
  exit(0);
}

include("audit.inc");
include("global_settings.inc");
include("linux_functions.inc");

# Define the target directory
dir = "/tmp";

# Check if the target directory exists
if(!stat(dir))
{
  audit(AUDIT_FILE_NOT_EXIST, dir);
  exit(0);
}

# Check if the target directory is a symbolic link
if(is_symlink(dir))
{
  audit(AUDIT_FILE_SYMLINK, dir);
  exit(0);
}

# Check if the target directory is a mountpoint
if(is_mountpoint(dir))
{
  audit(AUDIT_FILE_MOUNTPOINT, dir);
  exit(0);
}

# Check if the target directory has the correct owner
if(get_uid(dir) != 0)
{
  audit(AUDIT_FILE_OWNER, dir);
  exit(0);
}

# Check if the target directory has the correct group
if(get_gid(dir) != 0)
{
  audit(AUDIT_FILE_GROUP, dir);
  exit(0);
}

# Check if the target directory has the correct permissions
if((get_mode(dir) & 0777) != 01777)
{
  audit(AUDIT_FILE_PERM, dir);
  exit(0);
}

# If all checks passed, exit with success status
exit(1);
