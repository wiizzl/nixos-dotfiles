{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      gnome-themes-extra
      lxappearance
      qt5ct
      qt6ct
    ];

    sessionVariables = {
      GTK_THEME = "Adwaita-dark";
      GTK_APPLICATION_PREFER_DARK_THEME = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_STYLE_OVERRIDE = "Adwaita-dark";
      XCURSOR_THEME = "Adwaita";
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "Adwaita-dark";
  };

  xdg = {
    enable = true;
    mime.enable = true;
  };
}
