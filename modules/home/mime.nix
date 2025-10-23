{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
      "text/html" = "zen-beta.desktop";

      "text/plain" = "code.desktop";
      "application/x-shellscript" = "code.desktop";
      "text/x-chdr" = "code.desktop";
      "text/x-csrc" = "code.desktop";

      "image/jpeg" = "gimp.desktop";
      "image/png" = "gimp.desktop";
      "image/gif" = "gimp.desktop";

      "application/pdf" = "onlyoffice-desktopeditors.desktop";
    };
  };
}
