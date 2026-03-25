# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.enableAllFirmware = true;
  virtualisation.docker = {
    enable = false;
    autoPrune.enable = true;
  };

  networking = {
    hostName = "lambda";
    domain = "rwillia.ms";
    fqdn = "lambda.rwillia.ms";
    hosts = {
      "127.0.0.1" = [ "lambda.rwillia.ms" ];
      "::1" = [	"localhost" ];
      "192.168.1.205" = [ "homeassistant" ];
      "192.168.1.162" = [ "gamma" ];
      "192.168.1.226" = [ "pikvm" ];
      "192.168.1.53" = [ "gregor" ];
    };
  };

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";


  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rw = {
    isNormalUser = true;
    extraGroups = [ "wheel" "disk" "adm" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];

    openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMER1vKzrCrhX9L/4EfIfi3Kpe/HUPw0RMc/MbrQSIcs u0_a365@localhost"
      ];
    };
  };

  users.users.immich = {
    extraGroups = [ "users" "disk" ];
    linger = true;
  };

  users.users.unifi-poller = {
    extraGroups = [ "users" "disk" ];
    linger = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    curl
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  services.sshd.enable = true;

  services.openssh = {
    enable = true;
  };

  services.grafana = {
    enable = true;
    settings = {
      server = {
        protocol = "http";
	# cert_file = "/etc/cert.pem";
	# cert_key = "/etc/cert.key";
	http_addr = "192.168.1.192";
	http_port = 8081;
	domain = "graf.rwillia.ms";
	enforce_domain = false;
	root_url = "https://graf.rwillia.ms";
	enable_gzip = false;
      };
      security = {
        secret_key = "X4dD1AKvXtWTpI"; 
        cookie_secure = true;
	allow_embedding = true;
        csrf_trusted_origins = [
	  "http://localhost:9000"
          "https://192.168.1.192"
	  "http://192.168.1.192:9000"
	  "https://192.168.1.205"
	  "http://192.168.1.205"
	];
      };
    };
  };

  services.prometheus = {
    enable = true;
    port = 9000;
    listenAddress = "192.168.1.192";
    scrapeConfigs = [ 
      {
        job_name = "copyparty";
        metrics_path = "/.cpr/metrics";
        tls_config.insecure_skip_verify = true;
        basic_auth = {
          username = "rw";
          password = "?Willow21";
        };
        static_configs = [ {
          targets = [''nas.rwillia.ms''];
        } ];
      }
      {
        job_name = "unpoller";
	static_configs = [ {
          targets = [''0.0.0.0:9130''];
	} ];
      }
    ];
  };

  services.immich = {
    enable = true;
    host = "192.168.1.192";
    port = 2283;
    user = "immich";
    group = "immich";
  };

  services.unpoller = {
    enable = true;
    prometheus.disable = true;
    unifi = {
      defaults = {
        url = "https://192.168.1.1";
	verify_ssl = false;
	user = "rw";
	pass = "/etc/unifiPass";
	save_sites = true;
        save_ids = true;
      };
    };
    influxdb = {
      url = "http://192.168.1.205:8086";
      db = "unifi-poller";
      user = "unifi-poller";
      pass = "/etc/unifiPass";
      verify_ssl = false;
    };
  };
	
  services.prometheus.exporters.unpoller = {
    enable = true;
    controllers = [ {
      url = "https://192.168.1.1";
      verify_ssl = false;
      user = "rw";
      pass = "/etc/unifiPass";
      save_sites = true;
      save_ids = true;
      save_events = true;
      save_alarms = true;
      save_anomalies = true;
      save_dpi = true;
    } ];
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
    80
    81
    443
    2283
    3923
    3291
    8080
    8081
    9000
    9130
  ];
  networking.firewall.allowedUDPPorts = [
    22
    80
    81
    443
    2283
    3923
    3921
    8080
    8081
    9000
    9130
  ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment?

}
