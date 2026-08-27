{
  description = "rw's multihost nixos configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware = {
      url = "github:8bitbuddhist/nixos-hardware?rev=ed6d5e7d5dfb68369181b53736065596a844aed2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dank-greeter = {
      url = "github:AvengeMedia/dank-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-monitor.url = "github:antonjah/nix-monitor";
    copyparty.url = "github:9001/copyparty";
    agenix.url = "github:ryantm/agenix";
    authentik-nix.url = "github:nix-community/authentik-nix";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    niri-autoselect-portal.url = "git+https://codeberg.org/debugloop/niri-autoselect-portal.git";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    nixos-hardware,
    niri,
    dms,
    dank-greeter,
    danksearch,
    nix-monitor,
    copyparty,
    agenix,
    authentik-nix,
    nix-alien,
    nixos-wsl,
    niri-autoselect-portal,
    ...
  } @ inputs: {
    nixosConfigurations = let
      username = "rw";
      system = "x86_64-linux";
    in {
      gamma = let
        state = "25.05";
        host = "gamma";
        specialArgs = {inherit inputs username state host system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/${host}
            stylix.nixosModules.stylix
            nvf.nixosModules.default
            niri.nixosModules.niri
            dms.nixosModules.default
            dank-greeter.nixosModules.default
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = {
                imports = [
                  ./modules/home-manager/${host}
                  ./modules/home-manager/shared
                  dms.homeModules.dank-material-shell
                  dms.homeModules.niri
                  danksearch.homeModules.dsearch
                  nix-monitor.homeManagerModules.default
                  agenix.homeManagerModules.default
                  niri-autoselect-portal.homeManagerModules.default
                ];
                config.homeModules.shared.workstation.enable = true;
              };
            }
          ];
        };

      lambda = let
        state = "25.11";
        host = "lambda";
        specialArgs = {inherit inputs username state host system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/${host}
            nvf.nixosModules.default
            authentik-nix.nixosModules.default
            stylix.nixosModules.stylix
            agenix.nixosModules.default
            copyparty.nixosModules.default
            ({
              pkgs,
              config,
              ...
            }: {
              nixpkgs.overlays = [copyparty.overlays.default];
              environment.systemPackages = [pkgs.copyparty-unstable-full];
              services.copyparty = {
                enable = true;
                user = "rw";
                group = "users";
                settings = {
                  p = [3923];
                  ftp = 3921;
                  ftp-pr = "12000-12099";
                  z = true;
                  name = "Lambda NAS";
                  site = "https://nas.rwillia.ms/";
                  https-only = false;
                  ipu = "192.168.1.0/24=rw";
                  rproxy = 1;
                  stats = true;
                  usernames = true;
                  chpw = true;
                  ah-alg = "argon2";
                  shr = "/share";
                  shr-adm = ["rw"];
                  shr-site = "nas.rwillia.ms";
                  no-crt = true;
                };
                accounts = {
                  rw = {
                    passwordFile = "/home/rw/copyparty/config/keys/rw_pass";
                  };
                };
                volumes = {
                  "/" = {
                    path = "/mnt/raid0/copyparty";
                    access = {
                      r = ["*"];
                      rwmdgGhaA = ["rw"];
                    };
                    flags = {
                      fk = 4;
                      scan = 60;
                      e2dsa = true;
                      e2ts = true;
                      wram = true;
                      rm_partial = true;
                      magic = true;
                      gz = true;
                      xz = true;
                      nohash = "\.iso$";
                      norobots = true;
                    };
                  };
                };
                openFilesLimit = 8192;
              };
            })
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = {
                imports = [
                  ./modules/home-manager/${host}
                  ./modules/home-manager/shared
                ];
              };
            }
          ];
        };

      kappa = let
        state = "25.11";
        host = "kappa";
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
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = {
                imports = [
                  ./modules/home-manager/${host}
                  ./modules/home-manager/shared
                ];
                config.homeModules.shared.workstation.enable = true;
              };
            }
            {
              system.systemBuilderCommands = ''
                ln -s ${self} $out/flake
                ln -s ${self.nixosConfigurations.kappa.config.boot.kernelPackages.kernel.dev} $out/kernel-dev
              '';
            }
          ];
        };
      # nix build .#nixosConfigurations.surfaceRecovery.config.system.build.isoImage
      surfaceRecovery = let
        system = "x86_64-linux";
        specialArgs = {inherit inputs system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/kappa/configuration-base.nix
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            agenix.nixosModules.default
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            ({pkgs, ...}: {environment.systemPackages = [pkgs.vim];})
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
            ({pkgs, ...}: {
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
      omicron = let
        state = "26.05";
        host = "omicron";
        specialArgs = {inherit inputs username state host system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/${host}
            nixos-wsl.nixosModules.default
            stylix.nixosModules.stylix
            nvf.nixosModules.default
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = {
                imports = [
                  ./modules/home-manager/${host}
                  ./modules/home-manager/shared
                ];
              };
            }
            {
              system.stateVersion = "${state}";
              wsl = {
                enable = true;
                defaultUser = "${username}";
                ssh-agent = {
                  enable = true;
                  users = ["rw"];
                };
                interop.register = true;
                useWindowsDriver = true;
              };
            }
          ];
        };
    };
  };
}
