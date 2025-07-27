{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        rocmPackages.clr
      ];
    };

    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
      overdrive = {
        enable = true;
        ppfeaturemask = "0xffffffff";
      };
    };
  };

  systemd = {
    packages = with pkgs; [lact];
    services.lactd.wantedBy = ["multi-user.target"];
    tmpfiles.rules = [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };

  services.xserver.videoDrivers = ["amdgpu"];
  environment.systemPackages = with pkgs; [
    lact
    amdgpu_top
  ];
}
