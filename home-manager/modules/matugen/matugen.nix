{ inputs, ... }: {
	imports = [
		inputs.matugen.nixosModules.default
	];

	programs.matugen = {
		enable = true;

		templates = {
			kitty = {
				input_path = "~/nix/home-manager/modules/matugen/templates/kitty-colors.conf";
				output_path = "~/.config/kitty/colors.conf";
			};
			
			hyprland = {
				input_path = "~/nix/home-manager/modules/matugen/templates/hyprland-colors.conf";
				output_path = "~/.config/hypr/colors.conf";
				post_hook = "hyprctl reload";
			};
		};
	};
}
