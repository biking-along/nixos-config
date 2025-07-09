{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";
        globals.maplocalleader = ",";
        luaConfigPost = ''
          vim.opt.tabstop = 2
          vim.optsofttabstop = 2
          vim.opt.shiftwidth = 2
          vim.opt.expandtab = true
          vim.smartindent = true
          vim.opt.smoothscroll = true
          vim.opt.signcolumn = "number"
        '';
        lineNumberMode = "relNumber";
        lsp = {
          enable = true;
        };
        languages = {
          enableTreesitter = true;
          nix = {
            enable = true;
            format.enable = true;
          };
          bash.enable = true;
          css.enable = true;
          lua.enable = true;
          markdown.enable = true;
          yaml.enable = true;
        };
        # visuals.cinnamon-nvim.enable = true;
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        utility.smart-splits.enable = true;
        mini = {
          basics = {
            enable = true;
            setupOpts = {
              mappings.move_with_alt = true;
            };
          };
          icons.enable = true;
          # animate.enable = true;
          pairs.enable = true;
        };
      };
    };
  };
}
