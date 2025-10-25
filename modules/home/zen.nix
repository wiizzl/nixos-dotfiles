{ pkgs, inputs, ... }:

{
  imports = [ inputs.zen-browser.homeModules.beta ];

  stylix.targets.zen-browser.profileNames = [ "default" ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    policies =
      let
        mkLockedAttrs = builtins.mapAttrs (
          _: value: {
            Value = value;
            Status = "locked";
          }
        );

        mkExtensionEntry =
          {
            id,
            pinned ? false,
          }:
          let
            base = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
              installation_mode = "normal_installed";
            };
          in
          if pinned then base // { default_area = "navbar"; } else base;

        mkExtensionSettings = builtins.mapAttrs (
          _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
        );
      in
      {
        Preferences = mkLockedAttrs {
          "browser.tabs.warnOnClose" = false;
          "browser.aboutConfig.showWarning" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          "browser.gesture.swipe.left" = "";
          "browser.gesture.swipe.right" = "";
          "browser.tabs.hoverPreview.enabled" = true;
        };

        ExtensionSettings = mkExtensionSettings {
          "wappalyzer@crunchlabz.com" = mkExtensionEntry {
            id = "wappalyzer";
            pinned = true;
          };
          "uBlock0@raymondhill.net" = mkExtensionEntry {
            id = "ublock-origin";
            pinned = true;
          };
          "@react-devtools" = mkExtensionEntry {
            id = "react-developer-tools";
            pinned = true;
          };
          "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = "github-file-icons";
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes";
          "{74145f27-f039-47ce-a470-a662b129930a}" = "clearurls";
          "github-no-more@ihatereality.space" = "github-no-more";
          "github-repository-size@pranavmangal" = "gh-repo-size";
          "@searchengineadremover" = "searchengineadremover";
          "jid1-BoFifL9Vbdl2zQ@jetpack" = "decentraleyes";
          "trackmenot@mrl.nyu.edu" = "trackmenot";
          "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "stylus";
        };

        PasswordManagerEnabled = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };

    profiles."default" = {
      containersForce = true;
      spacesForce = true;
      pinsForce = true;

      settings = {
        "zen.tabs.vertical.right-side" = true;
        "zen.view.use-single-toolbar" = false;
        "zen.view.compact.animate-sidebar" = false;
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = false;
        "zen.welcome-screen.seen" = true;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
                tags = [ "nix" ];
              }
              {
                name = "wiki";
                tags = [
                  "wiki"
                  "nix"
                ];
                url = "https://wiki.nixos.org/";
              }
            ];
          }
        ];
      };

      containers = {
        Work = {
          color = "green";
          icon = "briefcase";
          id = 1;
        };
      };

      spaces = {
        "Pierre" = {
          id = "c6de089c-410d-4206-961d-ab11f988d40a";
          position = 1000;
        };
        "Work" = {
          id = "b7e3a2c1-8f4d-4e2b-9d7a-1f2e3c4b5a6d";
          container = 1;
          position = 2000;
        };
      };

      search = {
        force = true;
        default = "google";
        engines =
          let
            nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          in
          {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "np" ];
            };
            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "nop" ];
            };
            "Home Manager Options" = {
              urls = [
                {
                  template = "https://home-manager-options.extranix.com/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master"; # unstable
                    }
                  ];
                }
              ];
              icon = nixSnowflakeIcon;
              definedAliases = [ "hmop" ];
            };
          };
      };
    };
  };
}
