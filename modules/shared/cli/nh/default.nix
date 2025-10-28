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
  options.my.cli.nh = {
    enable = mkEnableOption "Enable Yet another Nix CLI helper (nh)";
  };

  config = mkIf cli.nh.enable {
    programs.nh = {
      enable = true;

      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };

      flake = "/home/pier/nix-config"; # sets NH_OS_FLAKE variable for you
    };
  };
}
