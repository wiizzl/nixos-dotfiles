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
  options.my.cli.ansible = {
    enable = mkEnableOption "Enable ansible";
  };

  config = mkIf cli.ansible.enable {
    environment.systemPackages = with pkgs; [
      ansible
    ];
  };
}
