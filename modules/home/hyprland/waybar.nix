{ pkgs, ... }:

{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        output = [ "DP-2" ];

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          "all-outputs" = false;
          "persistent-workspaces" = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          max-length = 50;
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        clock = {
          format-alt = "{:%a, %d. %b  %H:%M}";
        };
      };
    };

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: Roboto, Helvetica, Arial, sans-serif;
          font-size: 13px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(43, 48, 59, 0.5);
          border-bottom: 3px solid rgba(100, 114, 125, 0.5);
          color: white;
      }

      tooltip {
        background: rgba(43, 48, 59, 0.5);
        border: 1px solid rgba(100, 114, 125, 0.5);
      }
      tooltip label {
        color: white;
      }

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: white;
          border-bottom: 3px solid transparent;
      }

      #workspaces button.focused {
          background: #64727D;
          border-bottom: 3px solid white;
      }

      #mode, #clock, #battery {
          padding: 0 10px;
      }

      #mode {
          background: #64727D;
          border-bottom: 3px solid white;
      }

      #clock {
          background-color: #64727D;
      }

      #battery {
          background-color: #ffffff;
          color: black;
      }

      #battery.charging {
          color: white;
          background-color: #26A65B;
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: black;
          }
      }

      #battery.warning:not(.charging) {
          background: #f53c3c;
          color: white;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: steps(12);
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
    '';
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "waybar" ];
}
