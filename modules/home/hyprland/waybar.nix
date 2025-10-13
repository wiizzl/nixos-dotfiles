{ pkgs, ... }:

{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;

        "modules-left" = [
          "custom/notification"
          "clock"
          "custom/pacman"
          "tray"
        ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [
          "group/expand"
          "bluetooth"
          "network"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };
        };

        "custom/notification" = {
          tooltip = false;
          format = "";
          on-click = "swaync-client -t -sw";
          escape = true;
        };

        clock = {
          format = "{:%I:%M:%S %p} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#fAfBfC'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
          };
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format-disconnected = "Error";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} 🖧 ";
          on-click = "kitty nmtui";
        };

        battery = {
          interval = 30;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        "custom/expand" = {
          format = "";
          tooltip = false;
        };

        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };

        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules = [
            "custom/expand"
            "custom/colorpicker"
            "cpu"
            "memory"
            "temperature"
            "custom/endpoint"
          ];
        };

        "custom/colorpicker" = {
          format = "{}";
          return-type = "json";
          interval = "once";
          exec = "~/.config/waybar/scripts/colorpicker.sh -j";
          on-click = "~/.config/waybar/scripts/colorpicker.sh";
          signal = 1;
        };

        cpu = {
          format = "󰻠";
          tooltip = true;
        };

        memory = {
          format = "";
        };

        temperature = {
          critical-threshold = 80;
          format = "";
        };

        tray = {
          icon-size = 14;
          spacing = 10;
        };
      };
    };

    style = ''
      window#waybar{
        all:unset;
      }

      .modules-left {
        padding:7px;
        margin:10 0 5 10;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      .modules-center {
        padding:7px;
        margin:10 0 5 0;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      .modules-right {
        padding:7px;
        margin: 10 10 5 0;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }

      tooltip {
        background:@background;
        color: @color7;
      }

      #clock:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
        transition: all .3s ease;
        color:@color9;
      }

      #custom-notification {
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
      }

      #clock{
        padding: 0px 5px;
        color:@color7;
        transition: all .3s ease;
      }

      #custom-pacman{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
      }

      #workspaces {
        padding: 0px 5px;
      }

      #workspaces button {
        all:unset;
        padding: 0px 5px;
        color: alpha(@color9,.4);
        transition: all .2s ease;
      }

      #workspaces button:hover {
        color:rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }

      #workspaces button.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      #workspaces button.empty {
        color: rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
      }

      #workspaces button.empty:hover {
        color: rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }

      #workspaces button.empty.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      #bluetooth{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
      }

      #network{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
      }

      #battery{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
      }
      #battery.charging {
        color: #26A65B;
      }

      #battery.warning:not(.charging) {
        color: #ffbe61;
      }

      #battery.critical:not(.charging) {
        color: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #group-expand{
        padding: 0px 5px;
        transition: all .3s ease;
      }

      #custom-expand{
        padding: 0px 5px;
        color:alpha(@foreground,.2);
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
        transition: all .3s ease;
      }

      #custom-expand:hover{
        color:rgba(255,255,255,.2);
        text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
      }

      #custom-colorpicker{
        padding: 0px 5px;
      }

      #cpu,#memory,#temperature{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
      }

      #custom-endpoint{
        color:transparent;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);
      }

      #tray{
        padding: 0px 5px;
        transition: all .3s ease;
      }

      #tray menu * {
        padding: 0px 5px;
        transition: all .3s ease;
      }

      #tray menu separator {
        padding: 0px 5px;
        transition: all .3s ease;
      }
    '';
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [ "waybar" ];
  };
}
