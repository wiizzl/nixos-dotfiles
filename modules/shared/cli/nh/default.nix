{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) cli system;
in
{
  options.my.cli.nh = {
    enable = mkEnableOption "Enable Yet another Nix CLI helper (nh)";
  };

  config = mkIf cli.nh.enable {
    programs.nh = {
      enable = true;

      clean = {
        enable = !system.nix.garbage-collector.enable;
        extraArgs = "--keep-since ${toString system.nix.garbage-collector.days}d --keep 3";
      };

      flake = "/home/pier/nix-config"; # sets NH_OS_FLAKE variable for you
    };
  };
}
