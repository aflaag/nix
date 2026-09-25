{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    theme = "~/nix/home-manager/modules/rofi/style.rasi";
    package = pkgs.rofi;

    settings = {
      show-icons = true;
      font = "CaskaydiaCove Nerd Font 12";
      icon-theme = "Papirus Dark";
      terminal = "${pkgs.kitty}/bin/kitty";
    };
  };
}
