{
  system,
  inputs,
  ...
}: {
  environment.systemPackages = with inputs.nix-alien.packages.${system}; [
    nix-alien
  ];
}
