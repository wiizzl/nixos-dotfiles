{ config, ... }:

{
  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.${config.var.username} = {
    extraGroups = [
      "podman"
    ];
  };
}
