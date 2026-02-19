{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen.url = "github:InioX/Matugen";

    pokemon-icat.url = "github:aflaag/pokemon-icat";
  };

  outputs = { nixpkgs, home-manager, nur, matugen, pokemon-icat, ... }@inputs:
    let system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [ ./nixos/configuration.nix ];

        specialArgs = { inherit inputs; };
      };

      homeConfigurations.aless = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nur.overlays.default ];
        };

        modules = [ ./home-manager/home.nix ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
}
