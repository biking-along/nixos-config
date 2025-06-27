{ host, state, ... }:

{
  networking.hostName = "${host}";
  system.stateVersion = "${state}";
}
