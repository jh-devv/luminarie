{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.home.desktop.firefox;
in {
  config = mkIf cfg.enable {
    home.file.".mozilla/firefox/${config.home.username}/chrome/${cfg.theme.pname}/".source = cfg.theme;
    programs.firefox = {
      enable = true;
      policies = {
        # Documentation: https://mozilla.github.io/policy-templates/

        AppAutoUpdate = false;
        BackgroundAppUpdate = false;

        DisableBuiltinPDFViewer = true;
        DisableFirefoxStudies = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxScreenshots = true;
        DisableForgetButton = false;
        DisableMasterPasswordCreation = false;

        DisplayMenuBar = "default-off";

        DisableProfileImport = true;
        DisableProfileRefresh = true;
        DisableSetDesktopBackground = true;

        DisablePocket = true;
        DisableTelemetry = true;
        DisableFormHistory = true;
        DisablePasswordReveal = true;
        DisableSecurityBypass = true;
        DontCheckDefaultBrowser = true;
        HardwareAcceleration = true;
        OfferToSaveLogins = true;

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
          EmailTracking = true;
        };
        EncryptedMediaExtensions = {
          Enabled = true;
          Locked = true;
        };

        ExtensionUpdate = false;
        ExtensionSettings = with builtins; let
          extension = id: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${id}/latest.xpi";
              installation_mode = "normal_installed";
            };
          };
        in
          listToAttrs [
            {
              name = "*";
              value = {
                installation_mode = "blocked";
                blocked_install_message = "Please do not install from here, only from Nix. ≧◡≦";
              };
            }
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "styl-us" "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}")
          ];

        "3rdparty".Extensions = {
          # https://github.com/gorhill/uBlock/blob/master/platform/common/managed_storage.json
          "uBlock0@raymondhill.net".adminSettings = {
            userSettings = rec {
              uiTheme = "dark";
              uiAccentCustom = true;
              uiAccentCustom0 = "#b4befe";
              cloudStorageEnabled = false;
            };
            userFilters = ''
              mail.proton.me##.button-promotion.items-center.flex.max-w-full.button-outline-norm.button-medium.button
              mail.proton.me##.gap-5.items-center.flex-column.flex
            '';
            selectedFilterLists = [
              "adguard-generic"
              "adguard-annoyance"
              "adguard-cookies"
              "adguard-social"
              "adguard-spyware"
              "adguard-spyware-url"
              "adguard-popup-overlays"
              "adguard-other-annoyances"
              "adguard-widgets"
              "block-lan"
              "curben-phishing"
              "dpollock-0"
              "easylist"
              "easylist-chat"
              "easylist-newsletters"
              "easylist-notifications"
              "easylist-annoyances"
              "easyprivacy"
              "fanboy-cookiemonster"
              "fanboy-social"
              "fanboy-thirdparty_social"
              "FIN-0"
              "plowe-0"
              "ublock-abuse"
              "ublock-badware"
              "ublock-cookies-adguard"
              "ublock-cookies-easylist"
              "ublock-filters"
              "ublock-privacy"
              "ublock-quick-fixes"
              "ublock-unbreak"
              "ublock-annoyances"
              "urlhaus-1"
            ];
          };
        };

        FirefoxHome = {
          Search = true;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = false;
        };

        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
          Locked = true;
        };

        NoDefaultBookmarks = true;
        PasswordManagerEnabled = true;

        PDFjs = {
          Enabled = false;
          EnablePermissions = false;
        };

        PictureInPicture = {
          Enabled = true;
          Locked = true;
        };

        PrimaryPassword = true;
        PromptForDownloadLocation = true;

        SanitizeOnShutdown = {
          Cache = true;
          Cookies = false;
          Downloads = true;
          FormData = true;
          History = false;
          Sessions = false;
          SiteSettings = false;
          OfflineApps = false;
          Locked = true;
        };

        SearchSuggestEnabled = false;
        ShowHomeButton = true;
        StartDownloadsInTempDirectory = true;
        UserMessaging = {
          ExtensionRecommendations = false;
          FeatureRecommendations = false;
          Locked = true;
          MoreFromMozilla = false;
          SkipOnboarding = true;
          UrlbarInterventions = false;
          WhatsNew = false;
        };
        UseSystemPrintDialog = true;
        Preferences = {
          "browser.urlbar.suggest.topsites" = false;
          "general.smoothScroll" = true;
          "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
      };
      arkenfox = {
        enable = true;
        version = "122.0";
      };
      profiles = {
        "${config.home.username}" = {
          id = 0;
          isDefault = true;
          name = "${config.home.username}";

          userChrome = ''
            @import "${cfg.theme.pname}/userChrome.css";
          '';
          userContent = ''
            @import "${cfg.theme.pname}/userContent.css";
          '';

          search = {
            force = true;
            default = "Google";
            engines = {
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
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["@np"];
              };
              "NixOS Wiki" = {
                urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = ["@nw"];
              };
              "Wikipedia (en)".metaData.alias = "@wiki";
              "Amazon.com".metaData.hidden = true;
              "Bing".metaData.hidden = true;
              "eBay".metaData.hidden = true;
            };
          };

          settings = {
            # These are the settings for profile dependant (e.g. chrome themes) settings. ^-^
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.uidensity" = 0;
            "browser.theme.dark-private-windows" = false;
            "browser.toolbars.bookmarks.visibility" = "never";
            "svg.context-properties.content.enabled" = true;
            "widget.gtk.rounded-bottom-corners.enabled" = true;
          };

          arkenfox = {
            enable = true;
            #Documentation:
            # nix build "github:dwarfmaster/arkenfox-nixos#arkenfox-v122_0-doc-static"

            # STARTUP
            "0100" = {
              "0105".enable = true;
            };

            # GEOLOCATION
            "0200".enable = true;

            # QUIETER FOX
            "0300".enable = true;

            # BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on]
            "0600".enable = true;

            # DNS / DoH / PROXY / SOCKS
            "0700".enable = true;

            # LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORM
            "0800".enable = true;

            # PASSWORDS
            "0900".enable = true;

            # DISK AVOIDANCE
            "1000" = {
              enable = true;
              "1001".enable = false;
            };

            # HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
            "1200".enable = true;

            # REFERERS
            "1600".enable = true;

            # CONTAINERS
            "1700".enable = true;

            # PLUGINS / MEDIA / WEBRTC
            "2000".enable = true;

            # DOM (DOCUMENT OBJECT MODEL)
            "2400".enable = true;

            # MISCELLANEOUS
            "2600".enable = true;

            # ETP (ENHANCED TRACKING PROTECTION)
            "2700".enable = true;

            # RFP (resistFingerprinting)
            "4500" = {
              "4501".enable = true;
              "4503".enable = true;
              "4512".enable = true;
              "4513".enable = true;
            };

            # OPTIONAL OPSEC
            "5000" = {
              "5004".enable = true;
              "5007".enable = true;
              "5008".enable = true;
              "5016".enable = true;
              "5018".enable = true;
            };

            # OPTIONAL HARDENING
            "5500"."5505".enable = true;

            # DONT TOUTCH
            "6000".enable = true;

            # NON-PROJECT RELATED
            "9000".enable = true;
          };
        };
      };
    };
  };
}
