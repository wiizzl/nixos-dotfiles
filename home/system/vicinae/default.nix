{ ... }:

{
  imports = [ vicinae.homeManagerModules.default ];

  extra-substituters = [ "https://vicinae.cachix.org" ];
  extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];

  services.vicinae = {
    enable = true;
    autoStart = true;
  };
}
