{ ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 8;
      };

      efi.canTouchEfiVariables = true;
    };

    tmp.cleanOnBoot = true;

    kernelPackages = pkgs.linuxPackages_latest; # _zen, _hardened, _rt, _rt_latest, etc.
  };
}
