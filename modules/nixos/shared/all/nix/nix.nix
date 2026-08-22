{
  nix = {
    enable = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "cgroups"
        "dynamic-derivations"
        "fetch-closure"
        "impure-derivations"
        "parse-toml-timestamps"
        "read-only-local-store"
        "recursive-nix"
        "blake3-hashes"
        "configurable-impure-env"
        "fetch-tree"
        "git-hashing"
        "local-overlay-store"
        "mounted-ssh-store"
        "pipe-operators"
        "verified-fetches"
        "daemon-trust-override"
        "auto-allocate-uids"
      ];
      trusted-users = ["rw"];
      allowed-users = ["rw"];
      auto-optimise-store = true;
      cores = 10;
      sandbox = false;
      system-features = [
        "nixos-test"
        "benchmark"
        "big-parallel"
        "kvm"
      ];
    };
    extraOptions = ''
      allow-new-privileges = true
      use-registries = true
    '';
  };
  programs.direnv.nix-direnv.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-index.enable = true;
  programs.nix-required-mounts.enable = true;
  nixpkgs.config.allowUnfree = true;
}
