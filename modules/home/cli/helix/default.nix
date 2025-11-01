{ config, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (config.my) cli user;
in
{
  config = mkIf cli.helix.enable {
    home-manager.users.${user.name} = {
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
  };
}
