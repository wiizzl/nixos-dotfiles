{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  inherit (config.my) user;
in
{
  options.my.user = {
    enable = mkEnableOption "Enable user configuration";
    name = mkOption {
      type = types.str;
      default = "pier";
      description = "User account name";
    };
    homeDir = mkOption {
      type = types.str;
      default = "/home/${user.name}";
      description = "Home directory path";
    };
    home-manager = mkOption {
      type = types.bool;
      default = false;
      description = "Enable home-manager";
    };
    shell = mkOption {
      default = { };
      description = "Shell configuration";
      type = types.submodule {
        options = {
          package = mkOption {
            type = types.package;
            default = pkgs.bash;
            description = "Shell package";
          };
          starship = mkOption {
            type = types.bool;
            default = false;
            description = "Enable starship prompt";
          };
        };
      };
    };
  };

  config = mkIf user.enable {
    nix.settings.trusted-users = [ "${user.name}" ];

    users.users.${user.name} = {
      isNormalUser = true;
      createHome = true;
      description = "${username} account";
      extraGroups = [ "wheel" ];
      shell = user.shell.package;
    };
  };
}
