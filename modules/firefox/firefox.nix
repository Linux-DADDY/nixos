{ pkgs, config, ... }:

let
  makeExtension = extension: {
    install_url = "https://addons.mozilla.org/firefox/downloads/latest/${extension}/latest.xpi";
    installation_mode = "force_installed";
  };
in

{

  programs.firefox = {
    enable = true;
    preferences = {
      "browser.preferences.moreFromMozilla" = false;
      "layout.spellcheckDefault" = "5";
      "alerts.showFavicons" = true;
      "browser.aboutConfig.showWarning" = false;
      # "autoscrolling" = true;
      "privacy.donottrackheader.enabled" = true;
      "services.sync.prefs.sync.privacy.donottrackheader.enabled" = true;
      "browser.formfill.enable" = false;
      "general.autoScroll" = true;
      "privacy.bounceTrackingProtection.enabled" = true;
      "privacy.antitracking.testing" = true;
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_ever_enabled" = true;
      "privacy.globalprivacycontrol.enabled" = true;
      "browser.ctrlTab.sortByRecentlyUsed" = true;
    };
    policies = {
      "SearchEngines" = {
        "Default" = "ecosia";
        #   "Add" = [
        #     {
        #       "Name" = "Example1";
        #       "URLTemplate" = "https://www.example.org/q={searchTerms}";
        #       "Method" = "GET" | "POST";
        #       "IconURL" = "https://www.example.org/favicon.ico";
        #       "Alias" = "example";
        #       "Description" = "Description";
        #       "PostData" = "name=value&q={searchTerms}";
        #       "SuggestURLTemplate" = "https://www.example.org/suggestions/q={searchTerms}";
        #     };
        #   ]; 
      };
      "FirefoxHome" = {
        # "Search" = false;
        "TopSites" = false;
        "SponsoredTopSites" = false;
        "Highlights" = false;
        "Pocket" = false;
        "SponsoredPocket" = false;
        # "Snippets" = false;
        # "Locked" = false;
      };
      "ShowHomeButton" = true;
      "PromptForDownloadLocation" = true;
      "OverrideFirstRunPage" = "https://www.ecosia.org/";
      "PictureInPicture" = {
        "Enabled" = true;
        "Locked" = false;
      };
      "PopupBlocking" = {
        # "Allow" = ["http://example.org/", "http://example.edu/"];
        "Default" = true;
        "Locked" = true;
      };
      "DisableTelemetry" = true;
      "DisableFirefoxStudies" = true;
      "DisplayBookmarksToolbar" = "newtab";
      "EnableTrackingProtection" = {
        "Value" = true;
        "Locked" = true;
        "Cryptomining" = true;
        "Fingerprinting" = true;
      };
      "FirefoxSuggest" = {
        "WebSuggestions" = false;
        "SponsoredSuggestions" = false;
        "ImproveSuggest" = false;
        "Locked" = true;
      };
      "PasswordManagerEnabled" = false;
      "DisablePocket" = true;
      "HardwareAcceleration" = true;
      "browser.startup.blankWindow" = false;
      "DisableFirefoxAccounts" = true;
      "DisableAccounts" = true;
      "DisableFirefoxScreenshots" = true;
      "DontCheckDefaultBrowser" = true;
      "DisplayMenuBar" = "default-off";
      "ExtensionSettings" = {
        "*".installation_mode = "blocked";
        "queryamoid@kaply.com" = {
          install_url = "https://github.com/mkaply/queryamoid/releases/download/v0.1/query_amo_addon_id-0.1-fx.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = makeExtension "ublock-origin";
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";

          installation_mode = "force_installed";
        };
        "{e90f5de4-8510-4515-9f67-3b6654e1e8c2}" = makeExtension "dictionary-anywhere";
        "{00000f2a-7cde-4f20-83ed-434fcb420d71}" = makeExtension "imagus";
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = makeExtension "styl-us";
        "sponsorBlocker@ajay.app" = makeExtension "sponsorblock";
        "deArrow@ajay.app" = makeExtension "dearrow";
        "{2662ff67-b302-4363-95f3-b050218bd72c}" = makeExtension "untrap-for-youtube";
        "dont-track-me-google@robwu.nl" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/dont-track-me-google1/latest.xpi";
          installation_mode = "force_installed";
        };
        "idcac-pub@guus.ninja" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
          installation_mode = "force_installed";
        };
        "{154cddeb-4c8b-4627-a478-c7e5b427ffdf}" = makeExtension "PopUpOFF";
        "{74145f27-f039-47ce-a470-a662b129930a}" = makeExtension "ClearURLs";
        "danabok16@gmail.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-subscription-groups/latest.xpi";
          installation_mode = "force_installed";
        };
        "leechblockng@proginosko.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/leechblock-ng/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid0-dsq67mf5kjjhiiju2dfb6kk8dfw@jetpack" = makeExtension "Turbo-Download-Manager";
        "{b43b974b-1d3a-4232-b226-eaa2ac6ebb69}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/random_user_agent/latest.xpi";
          installation_mode = "force_installed";
        };
        "{aecec67f-0d10-4fa7-b7c7-609a2db280cf}" = makeExtension "Violentmonkey";
        # "@autoscroll" = {
        #     install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-scroll/latest.xpi";
        #     installation_mode = "force_installed";
        # };
        "browser-extension@anonaddy" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/addy_io/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d04b0b40-3dab-4f0b-97a6-04ec3eddbfb0}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ecosia-the-green-search/latest.xpi";
          installation_mode = "normal_installed";
        };
        "allistergrange@gmail.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/startertab-your-next-new-tab/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

}
