{ pkgs, ... } : {
	programs.kitty = {
		enable = true;

		settings = {
			include = "~/.config/kitty/colors.conf";

			shell = "${pkgs.zsh}/bin/zsh";

			font_family = "CaskaydiaCove Nerd Font";
			bold_font = "auto";
			italic_font = "auto";
			font_size = 13.0;
			cursor_shape = "block";
			cursor_blink_interval = 0;
			shell_integration = "no-cursor";
			initial_cwd = "~";
		};

		shellIntegration.enableZshIntegration = true;
	};
}
