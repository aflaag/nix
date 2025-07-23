{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;

		settings = {
			"$mainMod" = "SUPER";

			input = {
				kb_layout = "it";
				kb_options = "lv3:ralt_switch";
			};

			bind = [
				"$mainMod, L, exec, kitty --directory ~"
				"$mainMod, G, exec, rofi -show drun"
			];
		};
	};
}
