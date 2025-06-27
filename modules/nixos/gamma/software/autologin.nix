{ username, ... }:

{
  services.getty.autologinUser = "${username}";
  programs.fish.loginShellInit = ''
    if uwsm check may-start;
      exec uwsm start default
    end
  '';
}
