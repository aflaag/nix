{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		home-manager

		# Programs
		firefox
	
		# Desktkop
		hyprland
		xwayland
		xdg-desktop-portal-hyprland
		waybar
		dunst
		libnotify
		papirus-icon-theme

		# CLI utils
		util-linux
		vim
		wget
		tree
		htop
	];

	fonts.packages = with pkgs; [
		pkgs.nerd-fonts.caskaydia-mono
	];
}
