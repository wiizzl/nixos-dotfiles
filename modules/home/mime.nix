{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Browser
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
      "text/html" = "zen-beta.desktop";

      # Text edition
      "text/plain" = "code.desktop";
      "application/x-shellscript" = "code.desktop";
      "text/x-chdr" = "code.desktop";
      "text/x-csrc" = "code.desktop";
      "text/x-c++src" = "code.desktop";
      "text/x-python" = "code.desktop";
      "text/x-markdown" = "code.desktop";
      "application/json" = "code.desktop";

      # Images
      "image/jpeg" = "qimgv.desktop";
      "image/png" = "qimgv.desktop";
      "image/gif" = "qimgv.desktop";
      "image/webp" = "qimgv.desktop";
      "image/svg+xml" = "qimgv.desktop";

      # PDF & documents
      "application/pdf" = "onlyoffice-desktopeditors.desktop";
      "application/msword" = "onlyoffice-desktopeditors.desktop";

      # Audio
      "audio/mpeg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";

      # Video
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
    };
  };
}
