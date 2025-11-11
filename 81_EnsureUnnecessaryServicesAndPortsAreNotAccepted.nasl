#!/usr/bin/nasl

## Function to get the list of open ports
function get_open_ports()
{
  var cmd = "ss -tunlp";
  var output = exec(cmd);
  return output;
}

## Define a list of unnecessary services and ports
unnecessary_services = [ "telnet", "ftp", "tftp", "rsh", "rlogin" ];
unnecessary_ports = [ 23, 21, 69, 514, 544 ];

## Get the list of open ports
open_ports = get_open_ports();

## Check for unnecessary services and ports
for (service in unnecessary_services) {
  if (ereg(service, open_ports)) {
    security_warning(script:name, "Unnecessary service '" + service + "' is running");
  }
}

for (port in unnecessary_ports) {
  if (ereg(string(port), open_ports)) {
    security_warning(script:name, "Unnecessary port '" + port + "' is open");
  }
}

## If no unnecessary services or ports are found
if ( ! get_results_count() ) {
  security_note(script:name, "No unnecessary services or ports found");
}
