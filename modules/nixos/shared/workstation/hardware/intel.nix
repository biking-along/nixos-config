{
  hardware.cpu = {
    intel = {
      updateMicrocode = true;
      sgx = {
        enableDcapCompat = true;
        provision.enable = true;
      };
    };
  };
}
