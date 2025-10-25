{ ... }:

{
  nix.settings = {
    substituters = [ "https://vicinae.cachix.org" ];
    trusted-substituters = [ "https://vicinae.cachix.org" ];
    trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
  };

  services.vicinae = {
    enable = true;
    autoStart = true;

    settings = {
      faviconService = "twenty"; # twenty | google | none
      theme.name = "catppuccin-mocha";
    };
  };
}
