{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Browser

      "application/pdf" = "zen-beta.desktop";
      "application/x-extension-shtml" = "zen-beta.desktop";
      "application/x-extension-xhtml" = "zen-beta.desktop";
      "application/x-extension-html" = "zen-beta.desktop";
      "application/x-extension-xht" = "zen-beta.desktop";
      "application/x-extension-htm" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
      "x-scheme-handler/chrome" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "application/xhtml+xml" = "zen-beta.desktop";
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

      # Documents
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
