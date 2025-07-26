{ pkgs, inputs, ... }: {
    programs.firefox = {
        enable = true;
        profiles.default = {
            extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
                # missing
                #   emoji
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
