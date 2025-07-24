{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		home-manager

		# Programs
		firefox
		xfce.thunar
		pavucontrol
	
		# Desktkop
		hyprland
		xwayland
		xdg-desktop-portal-hyprland
		waybar
		dunst
		libnotify
		papirus-icon-theme
		pamixer
		brightnessctl
		gtk3
		gtk4

		# CLI utils
		util-linux
		vim
		wget
		tree
		htop
                pfetch
	];

	fonts.packages = with pkgs; [
		pkgs.nerd-fonts.caskaydia-mono
	];
}
