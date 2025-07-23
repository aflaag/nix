{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		# desktop
		swww
		rofimoji

		# programs
		neovim

		# CLI utils
		bat
		fzf
		ripgrep

		# others
		gh
	];
}
