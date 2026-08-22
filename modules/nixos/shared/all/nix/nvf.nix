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
          local imap_expr = function(lhs, rhs)
            vim.keymap.set('i', lhs, rhs, { expr = true })
          end
          imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
          imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
          _G.cr_action = function()
            if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
            return MiniPairs.cr()
          end
          vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })
        '';
        lineNumberMode = "relNumber";
        lsp = {
          enable = true;
          formatOnSave = true;
        };
        languages = {
          enableTreesitter = true;
          enableFormat = true;
          nix. enable = true;
          bash.enable = true;
          css.enable = true;
          lua.enable = true;
          markdown.enable = true;
          yaml.enable = true;
        };
        syntaxHighlighting = true;
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
          cinnamon-nvim = {
            enable = true;
            setupOpts = {
              keymaps = {
                basic = true;
                extra = true;
              };
            };
          };
          fidget-nvim.enable = true;
          syntax-gaslighting.enable = true;
        };
        mini = {
          animate = {
            enable = false;
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
              mappings ={
                move_with_alt = true;
                windows = true;
              };
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
