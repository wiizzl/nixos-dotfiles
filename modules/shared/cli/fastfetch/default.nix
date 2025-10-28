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
  options.cli.fastfetch = {
    enable = mkEnableOption "Enable fastfetch";
  };

  config = mkIf cli.fastfetch.enable {
    environment.systemPackages = with pkgs; [
      fastfetch
    ];
  };
}
