{
  description = "My nix config";

  inputs = {
    # change to github:nixos/nixpkgs/nixos-unstable for unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      # change to github:nix-community/home-manager for unstable
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: {
    nixosConfigurations = let
      user = "gabbar";
    in {
      # update with `nix flake update`
      # rebuild with `nixos-rebuild switch --flake .#dev`
      default = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs system user;
        };

        modules = [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs system user;
              };

              users.${user} = {
                imports = [
                  inputs.spicetify-nix.homeManagerModule
                  ./home.nix
                ];

                home = {
                  username = user;
                  homeDirectory = "/home/${user}";
                  # do not change this value
                  stateVersion = "23.11";
                };

                # Let Home Manager install and manage itself.
                programs.home-manager.enable = true;
              };
            };
          }
          ./configuration.nix
        ];
      };
    };
  };
}
