{
  programs.neovim.defaultEditor = true;
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        enableLuaLoader = true;
        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";
        globals.maplocalleader = ",";
        keymaps = [
          {
            key = "<leader>ff";
            mode = "n";
            action = "function() MiniFiles.open() end";
            lua = true;
          }
          {
            key = "<leader>;";
            mode = "n";
            action = "'m`A;<Esc>``'";
            lua = true;
          }
        ];
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
          formatOnSave = true;
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
        syntaxHighlighting = true;
        tabline.nvimBufferline.enable = true;
        terminal.toggleterm = {
          enable = true;
          lazygit = {
            enable = true;
          };
        };
        utility = {
          smart-splits.enable = true;
          yazi-nvim = {
            enable = true;
            setupOpts.open_for_directories = true;
          };
        };
        clipboard.providers.wl-copy.enable = true;
        visuals = {
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          syntax-gaslighting.enable = true;
        };
        mini = {
          animate = {
            enable = true;
          };
          cmdline.enable = true;
          completion = {
            enable = true;
          };
          diff.enable = true;
          snippets = {
            enable = true;
          };
          surround = {
            enable = true;
          };
          files = {
            enable = true;
          };
          git.enable = true;
          statusline = {
            enable = true;
          };
          tabline = {
            enable = true;
          };
          indentscope = {
            enable = true;
          };
          basics = {
            enable = true;
            setupOpts = {
              mappings.move_with_alt = true;
            };
          };
          comment.enable = true;
          icons.enable = true;
          pairs.enable = true;
        };
      };
    };
  };
}
