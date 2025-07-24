{ pkgs, inputs, ... }:
{
	imports = [
		inputs.matugen.nixosModules.default
	];

	config = {
		nixpkgs.config.allowUnfree = true;

		home.packages = with pkgs; [
			# desktop
			rofimoji
			inputs.matugen.packages.${system}.default

			# programs
			neovim

			# CLI utils
			bat
			fzf
			ripgrep
		];
	};
}
