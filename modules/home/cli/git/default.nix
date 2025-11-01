{ config, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (config.my) cli user;
in
{
  config = mkIf cli.git.enable {
    home-manager.users.${user.name} = {
      programs.git = {
        enable = true;

        settings = {
          user = {
            name = cli.git.name;
            email = cli.git.email;
          };

          url = {
            "https://github.com/" = {
              insteadOf = [
                "gh:"
                "github:"
              ];
            };
          };

          init.defaultBranch = "main";
          pull.rebase = true;
        };
      };
    };
  };
}
