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
  options.cli.ansible = {
    enable = mkEnableOption "Enable ansible";
  };

  config = mkIf cli.ansible.enable {
    environment.systemPackages = with pkgs; [
      ansible
    ];
  };
}
