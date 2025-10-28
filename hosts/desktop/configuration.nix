{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/import.nix
    ../../modules/shared/import.nix
    ../../modules/home/import.nix
  ];

  config = {
    system.stateVersion = "25.05";

    user = {
      enable = true;
      name = "pier";
      homeDir = "/home/pier";
      home-manager = true;

      shell = {
        package = pkgs.bash;
        starship = true;
      };
    };

    apps = {
      dbeaver.enable = true;
      element.enable = true;
      gimp.enable = true;
      obs.enable = true;
      onlyoffice.enable = true;
      postman.enable = true;
      qimgv.enable = true;
      thunderbird.enable = true;
      vlc.enable = true;
      vscode.enable = true;
      wezterm.enable = true;
      spotify.enable = true;
      discord.enable = true;
      zen.enable = true;
    };

    cli = {
      helix.enable = true;
      nh.enable = true;
      cava.enable = true;
      direnv.enable = true;
      fastfetch.enable = true;
      just.enable = true;
      bottom.enable = true;
      yazi.enable = true;
      git = {
        enable = true;
        name = "wiizzl";
        email = "github@houlliere.com";
      };
    };

    desktop = {
      hyprland.enable = true;

      addons = {
        stylix.enable = true;
        hyprpicker.enable = true;
        ly.enable = true;
        swaync.enable = true;
        screenshots.enable = true;
        hyprpaper.enable = true;
        rofi.enable = true;
        waybar.enable = true;
      };
    };

    services = {
      tailscale.enable = true;
    };

    system = {
      allow = {
        unfree = true;
        broken = true;
      };
      fonts = {
        enable = true;
        default = true;
      };
      shell.bash.enable = true;
      timezone = "Europe/Paris";
      utils = {
        enable = true;
        dev = true;
        fun = true;
      };
      audio.pipewire.enable = true;
      boot.systemd.enable = true;
      docs = {
        enable = true;
        man = true;
      };
      locale = {
        keymap = "fr";
        default-locale = "en_US.UTF-8";
        extra-locale = "fr_FR.UTF-8";
      };
      networking = {
        firewall.enable = false;
        hostname = "nixos";
        networkmanager.enable = true;
      };
      nix = {
        flakes.extra-options = ''
          warn-dirty = false
        '';
        garbage-collector = {
          enable = true;
          dates = "weekly";
          days = 7;
          auto-optimise-store = true;
        };
      };
      services = {
        bluetooth = {
          enable = true;
          blueman = true;
        };
        keyring = {
          enable = true;
          seahorse = true;
        };
        openssh.enable = true;
      };
      video.amd.enable = true;
      virtualisation = {
        podman = {
          enable = true;
          docker-compat = true;
          podman-desktop = true;
        };
        libvirtd = {
          enable = true;
          virt-manager = true;
        };
      };
    };
  };
}
