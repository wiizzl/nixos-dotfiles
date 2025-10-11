{ config, ... }:

let
  username = config.var.username;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };

    users."${username}" = {
      imports = [ ../home ];

      home = {
        username = username;
        homeDirectory = "/home/" + username;
        stateVersion = "25.05";
      };
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username} account";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
