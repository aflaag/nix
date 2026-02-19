{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
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
