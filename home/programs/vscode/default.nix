{ pkgs, ... }:

{ 
  stylix.targets.vscode.enable = false;

  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    profiles.default = {
      userSettings = {};
    };
  };
}

