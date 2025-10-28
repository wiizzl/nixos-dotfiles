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
  options.cli.helix = {
    enable = mkEnableOption "Enable Helix editor";
  };

  config = mkIf cli.helix.enable {
    environment.systemPackages = with pkgs; [
      helix
    ];
  };
}
