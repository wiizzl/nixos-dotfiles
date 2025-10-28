{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

with lib;
let
  inherit (config) user;
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

      users."pier" = {
        imports = [ ../home ];

        home = {
          username = "pier";
          homeDirectory = "/home/pier";
          stateVersion = "25.05";
        };
      };
    };

    programs.home-manager.enable = true;
  };
}
