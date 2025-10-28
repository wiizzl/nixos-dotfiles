{ config, lib, ... }:

with lib;
let
  inherit (config.my) system;
in
{
  options.my.system.timezone = mkOption {
    type = types.str;
    default = "America/New_York";
    description = "System timezone";
  };

  config = {
    time.timeZone = system.timezone;
  };
}
