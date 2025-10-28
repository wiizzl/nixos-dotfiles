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
  options.my.cli.fastfetch = {
    enable = mkEnableOption "Enable fastfetch";
  };

  config = mkIf cli.fastfetch.enable {
    environment.systemPackages = with pkgs; [
      fastfetch
    ];
  };
}
