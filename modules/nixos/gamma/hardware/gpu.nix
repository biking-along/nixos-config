{ pkgs, ... }:

{
  boot = {
    kernelParams = [
      "amdgpu.ppfeaturemask=0xfff7ffff"
    ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        rocmPackages.clr
        libva
        libva-utils
      ];  
    };
    amdgpu = {
      initrd.enable = true;
      overdrive.enable = true;
      opencl.enable = true;
    };
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  environment.systemPackages = with pkgs; [ lact ];
  services.frigate.vaapiDriver = "radeonsi";
  services.xserver.videoDrivers = ["amdgpu"];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
