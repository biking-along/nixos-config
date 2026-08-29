{username, ...}: {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
    extraSetFlags = [
      "--ssh"
      "--operator=${username}"
    ];
  };
}
