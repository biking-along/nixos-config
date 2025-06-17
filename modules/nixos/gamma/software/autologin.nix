{ username, ... }:

{
  services.getty.autologinUser = "${username}";
  programs.fish.loginShellInit = ''
    if uwsm check may-start && uwsm select;
      exec uwsm start default
    end
  '';
}
