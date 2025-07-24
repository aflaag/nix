{ pkgs, ... }: {
	gtk = {
		enable = true;

                iconTheme = {
                    name = "Papirus-Dark";
                    package = pkgs.papirus-icon-theme;
                };

		gtk3.extraCss = ''

                @import "colors.css";

/* Window background and text */
window {
  background-color: @window_bg_color;
  color: @window_fg_color;
}

/* Header bar background and text */
headerbar {
  background-color: @headerbar_bg_color;
  color: @headerbar_fg_color;
}

/* Popover windows */
popover {
  background-color: @popover_bg_color;
  color: @popover_fg_color;
}

/* Main view area (like Thunar's file view) */
.view {
  background-color: @view_bg_color;
  color: @view_fg_color;
}

/* Cards or panels */
.card {
  background-color: @card_bg_color;
  color: @card_fg_color;
}

/* Sidebar */
.sidebar {
  background-color: @sidebar_bg_color;
  color: @sidebar_fg_color;
  border-color: @sidebar_border_color;
  box-shadow: inset 0 0 10px @sidebar_backdrop_color;
}

/* Selected item in list or view */
.view:selected, 
.view:selected:focus {
  background-color: @accent_bg_color;
  color: @accent_fg_color;
}

/* Accent elements (buttons, links) */
button, 
entry, 
selection {
  background-color: @accent_bg_color;
  color: @accent_fg_color;
  border-color: @accent_color;
}

/* Add more widget selectors here as needed */

                '';

                gtk3.extraConfig = {
                    gtk-icon-theme-name = "Papirus-Dark";
                    gtk-application-prefer-dark-theme = true;
                };

		gtk4.extraCss = ''
			@import 'colors.css';
		'';
	};
}
