{
	imports = [
		./modules	

		./packages.nix
	];

	home = {
		username = "aless";
		homeDirectory = "/home/aless";
		stateVersion = "25.11";

		sessionVariables = {
			ICON_THEME = "Papirus";
		};
	};
}
