{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.shared.all.nix.nvf;
in {
  options = {
    modules.shared.all.nix.nvf = {
      enable = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Enable nvf settings.
        '';
      };
    };
  };
  config = mkIf cfg.enable {
    programs.neovim.defaultEditor = true;
    programs.nvf = {
      enable = true;
      settings = {
        mnw.desktopEntry = false;
        vim = {
          extraPlugins = {
            smart-splits-backend-tmux = {
              package = pkgs.vimUtils.buildVimPlugin {
                name = "smart-splits-backend-tmux";
                src = inputs.smart-splits-backend-tmux;
                setup = ''
                  require('smart-splits-backend-tmux').setup({
                    enable = true,
                    disable_nav_when_zoomed = true,
                    resize_amount = 3,
                    timeout = 300,
                  })
                '';
              };
            };
          };
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
            vim.opt.clipboard = "unnamedplus"
            vim.opt.autoread = true
            vim.opt.termguicolors = true
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
            vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
            vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
            vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
            vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
            vim.keymap.set('n', '<M-h>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<M-j>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<M-k>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<M-l>', require('smart-splits').resize_right)
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
            smart-paste-nvim = {
              enable = true;
              setupOpts = {
                keys = [
                  {
                    lhs = "p";
                    like = "p";
                    charwise_newline = "multiline";
                  }
                  {
                    lhs = "P";
                    like = "P";
                    charwise_newline = "multiline";
                  }
                ];
              };
            };
            smart-splits = {
              enable = true;
              setupOpts = {
                mux = {backend = "smart-splits-backend-tmux";};
                move = {at_edge = "split";};
              };
            };
            yazi-nvim = {
              enable = true;
              setupOpts.open_for_directories = true;
            };
          };
          # clipboard.providers.wl-copy.enable = true;
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
                mappings = {
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
  };
}
