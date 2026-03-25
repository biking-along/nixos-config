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
    retroarch-nix = {
      url = "github:StoppingBuck/retroarch-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-monitor = {
      url = "github:antonjah/nix-monitor";
    };
    copyparty.url = "github:9001/copyparty";
    agenix.url = "github:ryantm/agenix";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    nixos-hardware,
    retroarch-nix,
    niri,
    dms,
    danksearch,
    nix-monitor,
    copyparty,
    agenix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      gamma = let
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
            niri.nixosModules.niri
            dms.nixosModules.greeter
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = {
                programs.home-manager.enable = true;
                home = {
                  username = "${username}";
                  homeDirectory = "/home/${username}";
                  stateVersion = "${state}";
                };
                imports = [
                  ./modules/home-manager/${host}
                  inputs.dms.homeModules.dank-material-shell
                  inputs.dms.homeModules.niri
                  inputs.danksearch.homeModules.dsearch
                  nix-monitor.homeManagerModules.default
                ];
                programs.retroarch = {
                  enable = true;
                  cores = {
                    snes9x.enable = true;
                    mupen64plus.enable = true;
                    mgba.enable = true;
                    mesen.enable = true;
                    sameboy.enable = true;
                    dolphin.enable = true;
                    beetle-psx.enable = true;
                    pcsx2.enable = true;
                    ppsspp.enable = true;
                  };
                  settings = {
                    config_save_on_exit = "true";
                    cheevos_enable = "false";
                  };
                };
              };
            }
          ];
        };

      lambda = let
        username = "rw";
        state = "25.11";
        host = "lambda";
        system = "x86_64-linux";
        specialArgs = {inherit inputs username state host system;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "${system}";
          modules = [
            ./hosts/${host}
            nvf.nixosModules.default
            stylix.nixosModules.stylix

            agenix.nixosModules.default
            ({
              pkgs,
              config,
              ...
            }: {
              environment.systemPackages = [
                agenix.packages."${system}".default
              ];
            })

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
                programs.home-manager.enable = true;
                home = {
                  username = "${username}";
                  homeDirectory = "/home/${username}";
                  stateVersion = "${state}";
                };
                imports = [
                  ./modules/home-manager/${host}
                ];
              };
            }
            ###
          ];
        };

      kappa = let
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
            home-manager.nixosModules.home-manager
            {
              home-manager.users.${username} = {
                programs.home-manager.enable = true;
                home = {
                  username = "${username}";
                  homeDirectory = "/home/${username}";
                  stateVersion = "${state}";
                };
                imports = [
                  ./modules/home-manager/${host}
                ];
              };
            }
            {
              system.extraSystemBuilderCmds = ''
                ln -s ${self} $out/flake
                ln -s ${self.nixosConfigurations.kappa.config.boot.kernelPackages.kernel.dev} $out/kernel-dev
              '';
            }
            {nix.registry.nixpkgs.flake = nixpkgs;}
            {
              nix.registry.current.to = {
                type = "path";
                path = "/run/booted-system/flake/";
              };
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
            {
              nix.registry.nixpkgs.flake = nixpkgs;
              nix.settings.experimental-features = ["nix-command" "flakes"];
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
    };
  };
}
