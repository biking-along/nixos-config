{
  programs.fastfetch = {
    enable = true;
    settings = {
      
      logo = {
        type = "small";
	padding = {
          right = 1;
	};
      };

      modules = [
        {
          type = "custom";
	  format = "══════════════════════════";
	  outputColor = "34";
	}
	{
          type = "os";
	  format = "{name} {version}";
	}
	"kernel"
	{
          type = "packages";
	  format = "{nix-all} (nix-all)";
	}
	"shell"
	"uptime"
        {
          type = "custom";
	  format = "══════════════════════════";
	  outputColor = "34";
	}
      ];
    };
  };
}
