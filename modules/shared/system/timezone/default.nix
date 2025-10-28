{ config, lib, ... }:

with lib;
let
  inherit (config) system;
in
{
  options.system.timezone = mkOption {
    type = types.str;
    default = "America/New_York";
    description = "System timezone";
  };

  config = {
    time.timeZone = system.timezone;
  };
}
