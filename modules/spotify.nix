{ pkgs, ... }:

let
  theme = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "spicetify";
    rev = "4294a61";
    sha256 = "sha256-OHsauoCjj99aoIbq78xQf1ehYtLpIcUde5DmZSJFCXI=";
  };
in

{
  programs.spicetify = {
    enable = true;

    colorScheme = "mocha";
    theme = {
      name = "Catppucin";
      src = "${theme}/catppuccin";
    };
  };
}
