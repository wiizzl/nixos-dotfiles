{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) cli;
in
{
  options.my.cli.yazi = {
    enable = mkEnableOption "Enable Yazi file explorer";
  };

  config = mkIf cli.yazi.enable {
    environment.systemPackages = with pkgs; [
      yazi
    ];
  };
}
