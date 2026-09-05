{host, ...}: {
  networking.hostName = "${host}";
  system.stateVersion = "24.11";
}
