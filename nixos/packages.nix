{ inputs, pkgs, ... }: {
  imports = [ inputs.matugen.nixosModules.default ];

  environment.systemPackages = with pkgs; [
    # Flakes
    # inputs.pokemon-icat.packages.${pkgs.system}.default
    inputs.matugen.packages.${stdenv.hostPlatform.system}.default

    # Programs
    firefox
    xfce.thunar
    xfce.thunar-volman
    pavucontrol
    telegram-desktop
    helvum
    speedcrunch

    # Desktkop
    home-manager
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
    htop
    wl-clipboard
    git
    unzip
    usbutils
    gphoto2
    file

    # Package Managers
    nodejs
    python3
    cargo
    gcc
  ];

  fonts.packages = with pkgs; [ pkgs.nerd-fonts.caskaydia-cove ];
}
