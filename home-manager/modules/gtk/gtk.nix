{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme = {
      name = "Juno";
      package = pkgs.juno-theme;
    };

    font.name = "CaksaydiaCove Nerd Font";

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # gtk3.extraCss = builtins.readFile ./style.css;

    gtk3.extraConfig = {
      Settings = ''
        gtk-icon-theme-name=Papirus-Dark
        gtk-theme=Juno
        gtk-application-prefer-dark-theme=1
        gtk-cursor-theme-name=Bibata-Modern-Classic
      '';
    };

    # gtk4.extraCss = builtins.readFile ./style.css;
  };
}
