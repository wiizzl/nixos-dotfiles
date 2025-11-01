{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

with lib;
let
  inherit (config.my) user;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  config = mkIf user.home-manager.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {
        inherit inputs;
        inherit user;
      };

      users.${user.name} = {
        home = {
          username = user.name;
          homeDirectory = user.homeDir;
          stateVersion = "25.05";
        };
      };
    };
  };
}
