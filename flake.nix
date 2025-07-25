{
	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		matugen.url = "github:InioX/Matugen";

                firefox-addons = {
                    url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
                    inputs.nixpkgs.follows = "nixpkgs";
                };
	};

	outputs = { nixpkgs, home-manager, matugen, ... }@inputs:
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;

			modules = [ ./nixos/configuration.nix ];
		};

		homeConfigurations.aless = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home-manager/home.nix ];

			extraSpecialArgs = { inherit inputs; };
		};
	};
}
