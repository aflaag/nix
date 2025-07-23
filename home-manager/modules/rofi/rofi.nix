{ pkgs, ... }: {
	programs.rofi = {
		enable = true;
		theme = "~/nix/home-manager/modules/rofi/gruvbox-material.rasi";
		package = pkgs.rofi-wayland;
		terminal = "${pkgs.kitty}/bin/kitty";

		extraConfig = {
			show-icons = true;
			font = "CaskaydiaMono Nerd Font 12";
			icon-theme = "Papirus Dark";
		};
	};

	xdg.configFile."rofimoji.rc".text = ''
		action = copy
		skin-tone = neutral
	'';
}
