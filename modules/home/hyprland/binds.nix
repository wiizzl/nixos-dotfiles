{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "misc:middle_click_paste" = false;

    bind = [
      # Run applications
      "$mod, Return, exec, wezterm"
      "$mod, D, exec, rofi -show drun"
      "$mod, E, exec, thunar"
      "$mod, B, exec, zen-beta"
      "$mod, C, exec, code"

      # Window management
      "$mod, Z, togglefloating"
      "$mod, F, fullscreen"
      "$mod, P, pseudo"
      "$mod, W, togglesplit"

      # Kill focused window
      "$mod, Q, killactive"
      "Alt, F4, killactive"

      # Groups
      "$mod, G, togglegroup"
      "$mod Alt, H, changegroupactive, b"
      "$mod Alt, L, changegroupactive, f"

      # Move focus
      "ALT, Tab, cyclenext"
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      # Swap windows
      "$mod Shift, H, movewindow, l"
      "$mod Shift, L, movewindow, r"
      "$mod Shift, K, movewindow, u"
      "$mod Shift, J, movewindow, d"

      # Switch to a different workspaces
      "$mod, ampersand, workspace, 1"
      "$mod, eacute, workspace, 2"
      "$mod, quotedbl, workspace, 3"
      "$mod, apostrophe, workspace, 4"
      "$mod, parenleft, workspace, 5"
      "$mod, minus, workspace, 6"
      "$mod, egrave, workspace, 7"
      "$mod, underscore, workspace, 8"
      "$mod, ccedilla, workspace, 9"
      "$mod, agrave, workspace, 10"

      # Move focused window to workspace silently
      "$mod Shift, ampersand, movetoworkspacesilent, 1"
      "$mod Shift, eacute, movetoworkspacesilent, 2"
      "$mod Shift, quotedbl, movetoworkspacesilent, 3"
      "$mod Shift, apostrophe, movetoworkspacesilent, 4"
      "$mod Shift, parenleft, movetoworkspacesilent, 5"
      "$mod Shift, minus, movetoworkspacesilent, 6"
      "$mod Shift, egrave, movetoworkspacesilent, 7"
      "$mod Shift, underscore, movetoworkspacesilent, 8"
      "$mod Shift, ccedilla, movetoworkspacesilent, 9"
      "$mod Shift, agrave, movetoworkspacesilent, 10"

      # Move focused window to workspace
      "$mod Alt, ampersand, movetoworkspace, 1"
      "$mod Alt, eacute, movetoworkspace, 2"
      "$mod Alt, quotedbl, movetoworkspace, 3"
      "$mod Alt, apostrophe, movetoworkspace, 4"
      "$mod Alt, parenleft, movetoworkspace, 5"
      "$mod Alt, minus, movetoworkspace, 6"
      "$mod Alt, egrave, movetoworkspace, 7"
      "$mod Alt, underscore, movetoworkspace, 8"
      "$mod Alt, ccedilla, movetoworkspace, 9"
      "$mod Alt, agrave, movetoworkspace, 10"

      # Scroll trough workspaces with mod + scroll
      "$mod, mouse_down, workspace, e-1"
      "$mod, mouse_up, workspace, e+1"

      # Special workspaces
      "$mod Alt, X, movetoworkspace, special"
      "$mod Shift, X, movetoworkspacesilent, special"
      "$mod, X, togglespecialworkspace"

      # Capture
      "$mod Shift, P, exec, hyprpicker -adln"
      "$mod Shift, S, exec, hyprshot --mode region --freeze --output-folder ~/Pictures/Screenshots/"
    ];

    bindm = [
      # Move/resize windows with mod + LMB/RMB and dragging
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    binde = [
      # Resize windows
      "$mod Ctrl, H, resizeactive, -30 0"
      "$mod Ctrl, L, resizeactive, 30 0"
      "$mod Ctrl, J, resizeactive, 0 -30"
      "$mod Ctrl, K, resizeactive, 0 30"
    ];

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bindl = [
      # Requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
  };
}
