{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;

    #configPath = "${config.xdg.configHome}/mozilla/firefox";
    configPath = ".mozilla/firefox";

    profiles.default = {
      settings = {
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.startup.page" = 3;
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        # missing
        #   volume-control

        bitwarden
        darkreader
        simple-tab-groups
        ublock-origin
        unpaywall
      ];
    };
  };
}
