{
  description = "rw's multihost nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, stylix, nvf, lanzaboote, nixos-hardware, ... }@inputs: {
    nixosConfigurations = {
      gamma =  
        let
          username = "rw";
          state = "25.05";
          host = "gamma";
          system = "x86_64-linux";
          specialArgs = {inherit inputs username state host system;};
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/${host}
            stylix.nixosModules.stylix
            nvf.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
            home-manager.nixosModules.home-manager {
              home-manager.users.${username} = {
                home = {
                  username = "${username}";
                  homeDirectory = "/home/${username}";
                  stateVersion = "${state}";
                };
                programs.home-manager.enable = true;
                imports = [
                  ./modules/home-manager/shared
		  ./modules/home-manager/${host}
                ];
              };
            }
          ];
        };
    };
  };
}
