{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		# desktop
		swww
		rofimoji
		inputs.matugen.packages.$(system).default

		# programs
		neovim

		# CLI utils
		bat
		fzf
		ripgrep
	];
}
