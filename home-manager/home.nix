{ inputs, ... }: {
	imports = [
		./modules	

		./packages.nix
	
		#inputs.matugen.nixosModules.default
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
