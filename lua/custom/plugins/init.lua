-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {}
    end,
  },
  {
    'Vigemus/iron.nvim',
    config = function()
      require('iron.core').setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { 'zsh' },
            },
            python = {
              command = { 'python3' }, -- or { "ipython", "--no-autoindent" }
              format = require('iron.fts.common').bracketed_paste_python,
            },
            R = {
              command = { 'R' },
              format = require('iron.fts.common').bracketed_paste,
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require('iron.view').bottom(40),
        },
        keymaps = {
          send_motion = '<space>sc',
          visual_send = '<space>sc',
          send_file = '<space>sf',
          send_line = '<space>sl',
          send_paragraph = '<space>sp',
          send_until_cursor = '<space>su',
          send_mark = '<space>sm',
          mark_motion = '<space>mc',
          mark_visual = '<space>mc',
          remove_mark = '<space>md',
          cr = '<space>s<cr>',
          interrupt = '<space>s<space>',
          exit = '<space>sq',
          clear = '<space>cl',
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },

  -- {
  --   'nvim-neorg/neorg',
  --   lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  --   version = '*', -- Pin Neorg to the latest stable release
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ['core.defaults'] = {},
  --         ['core.concealer'] = {},
  --         ['core.dirman'] = {
  --           config = {
  --             workspaces = {
  --               personal = '~/Documents/management/notes/personal', -- Format: <name_of_workspace> = <path_to_workspace_root>
  --               bioversity = '~/Documents/management/notes/work/bioversity',
  --               recipes = '~/Documents/management/notes/recipes',
  --             },
  --             index = 'index.norg', -- The name of the main (root) .norg file
  --           },
  --         },
  --         ['core.qol.todo_items'] = {
  --           config = {
  --             create_todo_items = true,
  --             create_todo_parents = true,
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    version = '*',
    keys = {
      { '<leader>e', ':NvimTreeToggle<CR>', mode = 'n', silent = true },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  { 'mg979/vim-visual-multi' },
  -- {
  --   'hinell/lsp-timeout.nvim',
  --   lazy = false,
  --   dependencies = { 'neovim/nvim-lspconfig' },
  -- },
  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    opts = {
      grace_period = 60 * 10, -- set for 10 mins
    },
  },
}
