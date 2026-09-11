{
  networking = {
    fqdn = "bikingalong.com";
    fqdnOrHostName = "bikingalong.com";
    extraHosts = ''
      100.64.0.1 lambda
    '';
    firewall = {
      allowedTCPPorts = [
        80
        443
      ];
    };
  };
  programs.ssh.startAgent = true;
}
