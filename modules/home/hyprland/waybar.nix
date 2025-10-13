{ pkgs, ... }:

{
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;
        output = [ "DP-2" ];

        "modules-left" = [
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "clock"
          "tray"
        ];
        "modules-right" = [
          "group/expand"
          "battery"
          "custom/notification"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
        };

        "custom/notification" = {
          tooltip = false;
          format = " ";
          on-click = "swaync-client -t -sw";
          escape = true;
        };

        clock = {
          format = "{:%I:%M:%S}";
          format-alt = "{:%a. %d %b.}";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          actions = {
            on-scroll-up = "shift_down";
            on-scroll-down = "shift_up";
          };
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
          ];
        };

        "custom/colorpicker" = {
          format = " ";
          interval = "once";
          on-click = "hyprpicker -adln";
          tooltip-format = "Colorpicker";
        };

        cpu = {
          format = " ";
          tooltip = true;
        };

        memory = {
          format = " ";
          tooltip = true;
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
        background: rgba(30, 30, 46, 0.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      .modules-center {
        padding:7px;
        margin:10 0 5 0;
        border-radius:10px;
        background: rgba(30, 30, 46, 0.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      .modules-right {
        padding:7px;
        margin: 10 10 5 0;
        border-radius:10px;
        background: rgba(30, 30, 46, 0.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      tooltip {
        background: #1e1e2e;
        color: #b4befe;
      }
      #clock:hover, #custom-pacman:hover, #custom-notification:hover,#battery:hover,#cpu:hover,#memory:hover{
        transition: all .3s ease;
        color: #f5c2e7;
      }
      #custom-notification {
        padding: 0px 5px;
        transition: all .3s ease;
        color: #cdd6f4;
      }
      #clock{
        padding: 0px 5px;
        color: #cdd6f4;
        transition: all .3s ease;
      }
      #custom-pacman{
        padding: 0px 5px;
        transition: all .3s ease;
        color: #cdd6f4;
      }
      #workspaces {
        padding: 0px 5px;
      }
      #workspaces button {
        all:unset;
        padding: 0px 5px;
        color: rgba(245, 196, 231, 0.4);
        transition: all .2s ease;
      }
      #workspaces button:hover {
        color:rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }
      #workspaces button.active {
        color: #f5c2e7;
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
        color: #f5c2e7;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      #battery{
        padding: 0px 5px;
        transition: all .3s ease;
        color: #cdd6f4;
      }
      #battery.charging {
        color: #a6e3a1;
      }
      #battery.warning:not(.charging) {
        color: #f9e2af;
      }
      #battery.critical:not(.charging) {
        color: #f38ba8;
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
        color:rgba(205, 214, 244, 0.2);
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
        color: #cdd6f4;
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
