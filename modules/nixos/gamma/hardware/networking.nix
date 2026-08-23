{
  networking.interfaces = {
    "enp7s0" = {
      wakeOnLan = {
        enable = true;
        policy = [
          "magic"
        ];
      };
    };
  };
}
