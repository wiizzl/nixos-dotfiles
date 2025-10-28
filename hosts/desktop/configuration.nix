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

    my = {
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
        qimgv.enable = true;
        thunderbird.enable = true;
        vlc.enable = true;
        vscode.enable = true;
        wezterm.enable = true;
        # spotify.enable = true;
        # discord.enable = true;
        # zen.enable = true;
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
          hyprpicker.enable = true;
          ly.enable = true;
          swaync.enable = true;
          screenshots.enable = true;
          hyprpaper.enable = true;
          rofi.enable = true;
          waybar.enable = true;
          stylix = {
            enable = true;
            autoEnable = true;

            polarity = "dark";

            # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
            base16Scheme = {
              base00 = "1e1e2e";
              base01 = "181825";
              base02 = "313244";
              base03 = "45475a";
              base04 = "585b70";
              base05 = "cdd6f4";
              base06 = "f5e0dc";
              base07 = "b4befe";
              base08 = "f38ba8";
              base09 = "fab387";
              base0A = "f9e2af";
              base0B = "a6e3a1";
              base0C = "94e2d5";
              base0D = "cba6f7";
              base0E = "89b4fa";
              base0F = "f2cdcd";
            };

            cursor = {
              package = pkgs.bibata-cursors;
              name = "Bibata-Modern-Ice";
              size = 32;
            };

            fonts = {
              monospace = {
                package = pkgs.nerd-fonts.meslo-lg;
                name = "Meslo LGM Nerd Font";
              };
              sansSerif = {
                package = pkgs.montserrat;
                name = "Montserrat";
              };
              serif = {
                package = pkgs.dm-sans;
                name = "DM Sans";
              };
              emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
              };
              sizes = {
                applications = 11;
                desktop = 11;
                popups = 11;
                terminal = 13;
              };
            };
          };
        };
      };

      services = {
        tailscale.enable = true;
      };

      system = {
        allow = {
          unfree.enable = true;
          broken.enable = true;
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
  };
}
