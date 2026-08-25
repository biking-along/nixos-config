{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      shell-integration-features = [
        "cursor,sudo,title,ssh-env,no-ssh-terminfo,no-path"
      ];
    };
  };
}
