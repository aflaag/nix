{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		home-manager

		# Programs
		firefox
		xfce.thunar
		pavucontrol
                telegram-desktop
	
		# Desktkop
		hyprland
		xwayland
		xdg-desktop-portal-hyprland
		waybar
		dunst
		libnotify
		papirus-icon-theme
                adwaita-icon-theme
		pamixer
		brightnessctl
		gtk3
		gtk4
                hyprpicker

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
