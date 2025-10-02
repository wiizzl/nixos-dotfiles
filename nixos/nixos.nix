{ config, ... }:

let
  autoGarbageCollector = config.var.autoGarbageCollector;
in
{
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  nix = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
