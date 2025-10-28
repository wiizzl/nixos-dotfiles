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
  config = mkIf cli.helix.enable {
    programs.helix = {
      enable = true;

      settings = {
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };
  };
}
