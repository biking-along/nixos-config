{
  programs.fish = {
    enable = true;
    interactiveShellInit = "fastfetch";
    shellAliases = {
      nv = "nvim";
      ls = "eza";
      cat = "bat";
      man = "batman";
      gg = "lazygit";
    };
  };
}
