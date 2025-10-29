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
  config = mkIf cli.dev.js.enable {
    environment.systemPackages = with pkgs; [
      nodejs
      bun
      yarn
      pnpm
    ];
  };
}
