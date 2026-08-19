{
  systemd.user.services = {
    wsl2-ssh-agent.service = {
      enable = true;
      unitConfig = {
        Description = "WSL2 SSH Agent Bridge";
        ConditionUser = "!root";
      };
      after = "network.target";
      serviceConfig = {
        ExecStart = "/usr/bin/wsl2-ssh-agent --verbose --foreground --socket=%t/wsl2-ssh-agent.sock";
        Restart = "on-failure";
      };
      wantedBy = "default.target";
    };
  };
}
