{ config, lib, ... }:

with lib;
let
  inherit (config.my) cli;
in
{
  options.my.cli.dev = {
    js.enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable JavaScript development environment";
    };
  };
}
