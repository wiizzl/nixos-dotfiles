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
  options.my.cli.microfetch = {
    enable = mkEnableOption "Enable Microscopic fetch tool";
  };

  config = mkIf cli.microfetch.enable {
    environment.systemPackages = with pkgs; [
      microfetch
    ];
  };
}
