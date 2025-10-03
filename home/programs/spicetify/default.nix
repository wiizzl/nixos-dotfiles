{
  pkgs,
  config,
  inputs,
  ...
}:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;

    # colorScheme = "custom";
    # customColorScheme = {
    #   button = accent;
    #   button-active = accent;
    #   tab-active = accent;
    #   player = background;
    #   main = background;
    #   sidebar = background;
    # };

    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      adblock
    ];
  };
}
