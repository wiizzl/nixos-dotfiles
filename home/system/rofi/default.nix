{ config, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  stylix.targets.rofi.enable = false;

  programs.rofi = {
    enable = true;

    modes = [
      "drun"
      "window"
    ];

    extraConfig = {
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = "";
      kb-row-up = "Up,Control+k";
      kb-row-left = "Left,Control+h";
      kb-row-right = "Right,Control+l";
      kb-row-down = "Down,Control+j";
      kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";
      kb-remove-to-eol = "";
      kb-move-char-back = "Control+b";
      kb-remove-char-back = "BackSpace";
      kb-move-char-forward = "Control+f";
      kb-mode-complete = "Control+o";
    };

    theme = {
      "*" = {
        rosewater = mkLiteral "#f5e0dc";
        flamingo = mkLiteral "#f2cdcd";
        pink = mkLiteral "#f5c2e7";
        mauve = mkLiteral "#cba6f7";
        red = mkLiteral "#f38ba8";
        maroon = mkLiteral "#eba0ac";
        peach = mkLiteral "#fab387";
        yellow = mkLiteral "#f9e2af";
        green = mkLiteral "#a6e3a1";
        teal = mkLiteral "#94e2d5";
        sky = mkLiteral "#89dceb";
        sapphire = mkLiteral "#74c7ec";
        blue = mkLiteral "#89b4fa";
        lavender = mkLiteral "#b4befe";
        text = mkLiteral "#cdd6f4";
        subtext1 = mkLiteral "#bac2de";
        subtext0 = mkLiteral "#a6adc8";
        overlay2 = mkLiteral "#9399b2";
        overlay1 = mkLiteral "#7f849c";
        overlay0 = mkLiteral "#6c7086";
        surface2 = mkLiteral "#585b70";
        surface1 = mkLiteral "#45475a";
        surface0 = mkLiteral "#313244";
        base = mkLiteral "#1e1e2e";
        mantle = mkLiteral "#181825";
        crust = mkLiteral "#11111b";
        bg = mkLiteral "@base";
        hv = mkLiteral "@mauve";
        primary = mkLiteral "@surface1";
        ug = mkLiteral "@red";
        kl = mkLiteral "@blue";
        font = mkLiteral "\"Monospace 11\"";
        black = mkLiteral "#000000";
        transparent = mkLiteral "rgba(46,52,64,0)";
        background-color = mkLiteral "@bg";
        border = mkLiteral "0px";
      };

      "window" = {
        width = 700;
        orientation = mkLiteral "horizontal";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        transparency = mkLiteral "\"screenshot\"";
        border-color = mkLiteral "@transparent";
        border = mkLiteral "0px";
        border-radius = mkLiteral "6px";
        spacing = mkLiteral "0";
        children = map mkLiteral [ "mainbox" ];
      };

      "mainbox" = {
        spacing = mkLiteral "0";
        children = map mkLiteral [
          "inputbar"
          "message"
          "listview"
        ];
      };

      "inputbar" = {
        color = mkLiteral "@kl";
        padding = mkLiteral "11px";
        border = mkLiteral "3px 3px 2px 3px";
        border-color = mkLiteral "@primary";
        border-radius = mkLiteral "6px 6px 0px 0px";
      };

      "message" = {
        padding = mkLiteral "0";
        border-color = mkLiteral "@primary";
        border = mkLiteral "0px 1px 1px 1px";
      };

      "entry" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };

      "prompt" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        margin = mkLiteral "0px 5px 0px 0px";
      };

      "case-indicator" = {
        text-font = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "listview" = {
        layout = mkLiteral "vertical";
        padding = mkLiteral "8px";
        lines = 7;
        columns = 2;
        border = mkLiteral "0px 3px 3px 3px";
        border-radius = mkLiteral "0px 0px 6px 6px";
        border-color = mkLiteral "@primary";
        dynamic = false;
      };

      "element" = {
        padding = mkLiteral "2px";
        vertical-align = mkLiteral "1";
        color = mkLiteral "@kl";
        font = mkLiteral "inherit";
      };

      "element-text" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
      };

      "element selected.normal" = {
        color = mkLiteral "@black";
        background-color = mkLiteral "@hv";
      };

      "element normal active" = {
        background-color = mkLiteral "@hv";
        color = mkLiteral "@black";
      };

      "element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        size = mkLiteral "2.5em";
      };

      "element normal urgent" = {
        background-color = mkLiteral "@primary";
      };

      "element selected active" = {
        background = mkLiteral "@hv";
        foreground = mkLiteral "@bg";
      };

      "button" = {
        padding = mkLiteral "6px";
        color = mkLiteral "@primary";
        horizonatal-align = mkLiteral "0.5";
        border = mkLiteral "2px 0px 2px 2px";
        border-radius = mkLiteral "4px 0px 0px 4px";
        border-color = mkLiteral "@primary";
      };

      "button selected normal" = {
        border = mkLiteral "2px 0px 2px 2px";
        border-color = mkLiteral "@primary";
      };
    };
  };
}
