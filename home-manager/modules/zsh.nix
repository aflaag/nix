{ config, ...}: {
	programs.zsh = {
		enable = true;

		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = {
			l = "ls -la";
			rm = "rm -i";

			rebuild-nixos = "sudo nixos-rebuild switch --flake path:/home/aless/nix";
			rebuild-home = "home-manager switch --flake path:/home/aless/nix";
		};

		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "z"];
                        custom = "${config.home.homeDirectory}/.config/zsh";
			theme = "robbyrussell_custom";
		};
	};
}
