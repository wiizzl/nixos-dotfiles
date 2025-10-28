{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config) cli;
in
{
  options.cli.yazi = {
    enable = mkEnableOption "Enable Yazi file explorer";
  };

  config = mkIf cli.yazi.enable {
    environment.systemPackages = with pkgs; [
      yazi
    ];
  };
}
