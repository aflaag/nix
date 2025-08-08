{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager

    # Programs
    firefox
    xfce.thunar
    xfce.thunar-volman
    pavucontrol
    telegram-desktop
    helvum
    speedcrunch

    # Desktkop
    hyprland
    xwayland
    xdg-desktop-portal-hyprland
    waybar
    dunst
    libnotify
    brightnessctl
    gtk3
    gtk4
    hyprpicker
    hyprshot
    swappy

    # CLI utils
    util-linux
    vim
    wget
    tree
    killall
    htop
    pfetch
    wl-clipboard
    git
    unzip
    usbutils
    gphoto2

    nodejs
    python3
    cargo
    gcc

    # inputs.pokemon-icat.packages.${pkgs.system}.default
  ];

  fonts.packages = with pkgs; [ pkgs.nerd-fonts.caskaydia-cove ];
}
