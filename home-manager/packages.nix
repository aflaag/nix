{ pkgs, inputs, ... }: {
  config = {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      # Programs
      neovim
      rofimoji

      # CLI utils
      bat
      fzf
      ripgrep
      hexyl
      tldr
      pfetch
      btop
    ];
  };
}
