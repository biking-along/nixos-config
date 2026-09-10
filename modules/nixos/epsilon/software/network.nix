{
  networking = {
    fqdn = "bikingalong.com";
    fqdnOrHostName = "bikingalong.com";
    extraHosts = ''
      192.168.0.192 lambda
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
