{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  inherit (config) cli;
in
{
  options.cli.bottom = {
    enable = mkEnableOption "Enable bottom";
  };

  config = mkIf cli.bottom.enable {
    environment.systemPackages = with pkgs; [
      bottom
    ];
  };
}
