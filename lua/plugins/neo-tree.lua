-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>tf', ':Neotree toggle<CR>', desc = '[T]oggle [F]ile Navigator', silent = true },
    { '<leader>tg', ':Neotree git_status focus<CR>', desc = '[T]oggle [G]it Status', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
	hide_gitignored = true,
        },
      window = {
        mappings = {
          ['\\'] = 'close_window',
	  ['<cr>'] = 'open_nofocus',
        },
      },
      commands = {
        open_nofocus = function (state) 
          require('neo-tree.sources.filesystem.commands').open(state)
	  vim.schedule(function ()
	    vim.cmd([[Neotree close]])
	  end)
	end,
	},
      },
    },
  }
