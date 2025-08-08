{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    theme = "~/nix/home-manager/modules/rofi/style.rasi";
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.kitty}/bin/kitty";

    extraConfig = {
      show-icons = true;
      font = "CaskaydiaCove Nerd Font 12";
      icon-theme = "Papirus Dark";
    };
  };
}
