{ host, state, ... }:

{
  imports =
    [

    ];

  networking.hostName = "${host}";

  system.stateVersion = "${state}";

}
