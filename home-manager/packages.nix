{ pkgs, inputs, ... }: {
  imports = [ inputs.matugen.nixosModules.default ];

  config = {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      # Flakes
      inputs.matugen.packages.${system}.default

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
