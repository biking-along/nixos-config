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
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
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
                  ./modules/home-manager
                ];
              };
            }
          ];
        };
      kappa =
        let
          username = "rw";
          state = "25.11";
          host = "kappa";
          system = "x86_64-linux";
          specialArgs = {inherit inputs username state host system;};
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/${host}
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            stylix.nixosModules.stylix
            nvf.nixosModules.default
            home-manager.nixosModules.home-manager {
              home-manager.users.${username} = {
                home = {
                  username = "${username}";
                  homeDirectory = "/home/${username}";
                  stateVersion = "${state}";
                };
                programs.home-manager.enable = true;
                imports = [
                  ./modules/home-manager
                ];
              };
            }
            {
              system.extraSystemBuilderCmds = ''
                ln -s ${self} $out/flake
                ln -s ${self.nixosConfigurations.kappa.config.boot.kernelPackages.kernel.dev} $out/kernel-dev
              '';
            }
            { nix.registry.nixpkgs.flake = nixpkgs; }
            {
              nix.registry.current.to = {
                type = "path";
                path = "/run/booted-system/flake/";
              };
            }
          ];
        };

      # nix build .#nixosConfigurations.surfaceRecovery.config.system.build.isoImage
      surfaceRecovery = 
        let
          system = "x86_64-linux";
          specialArgs = {inherit inputs system;};
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/kappa/configuration-base.nix
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            ({ pkgs, ... }: { environment.systemPackages = [ pkgs.vim ]; })
            {
              isoImage.squashfsCompression = "gzip -Xcompression-level 1";
              boot.supportedFilesystems = nixpkgs.lib.mkForce [
                "btrfs"
                "ext4"
                "f2fs"
                "ntfs"
                "vfat"
                "xfs"
              ];
            }
            { nix.registry.nixpkgs.flake = nixpkgs;
              nix.settings.experimental-features = [ "nix-command" "flakes" ];
            }
            ({ pkgs, ... }: {
              services.getty.helpLine = ''
                Exit the prompt to see this help again.
                The nixos-config repo can be found at /home/nixos/nixos-config/.
              '';

              boot.postBootCommands = ''
                ln -s ${self} /home/nixos/nixos-config
              '';
            })
          ];
        };
    };
  };
}
