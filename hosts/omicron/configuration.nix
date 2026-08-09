{
  host,
  state,
  ...
}: {
  system.stateVersion = "${state}";
  networking.hostName = "${host}";
}
