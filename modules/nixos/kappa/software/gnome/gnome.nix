{pkgs, ...}: {
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };

  #Display manager settings
  services.displayManager = {
    gdm = {
      enable = true;
      autoSuspend = true;
    };
  };

  security.pam.services."rw".enableGnomeKeyring = true;

  environment.shells = with pkgs; [fish];

  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;

  services.gnome.gcr-ssh-agent.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    baobab # disk usage analyzer
    epiphany # web browser
    gedit # text editor
    simple-scan # document scanner
    totem # video player
    yelp # help viewer
    geary # email client
    seahorse # password manager
    evince
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-screenshot
    gnome-weather
    gnome-connections
    gnome-tour
    orca
  ];
  # We also lose nautilus now though, so we add back stuff we actually care about...
  environment.systemPackages = with pkgs; [
    file-roller # archive manager
    gnome-system-monitor
    gnome-disk-utility
    nautilus
    xwininfo
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gjs-osk
  ];

  services.udev.packages = [pkgs.gnome-settings-daemon];

  services.xserver.excludePackages = [pkgs.xterm];
}
