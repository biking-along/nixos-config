{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";
        globals.maplocalleader = ",";
        luaConfigPost = "vim.opt.tabstop = 2\nvim.optsofttabstop = 2\nvim.opt.shiftwidth = 2\nvim.opt.expandtab = true\nvim.smartindent = true\nvim.opt.smoothscroll = true\nvim.opt.signcolumn = 'number'";
        lineNumberMode = "relNumber";
        lsp = {
          enable = true;
        };
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          bash.enable = true;
          css.enable = true;
          lua.enable = true;
          markdown.enable = true;
          yaml.enable = true;
        };
        visuals.cinnamon-nvim.enable = true;
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
    };
  };
}
