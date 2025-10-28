{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  inherit (config.my) cli;
in
{
  options.my.cli.bottom = {
    enable = mkEnableOption "Enable bottom";
  };

  config = mkIf cli.bottom.enable {
    environment.systemPackages = with pkgs; [
      bottom
    ];
  };
}
