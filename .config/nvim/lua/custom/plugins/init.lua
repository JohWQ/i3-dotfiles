-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        [[   N E O V I M   ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button('f', '󰱼  Find file (~)', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Recent', ':Telescope oldfiles<CR>'),
        dashboard.button('q', '󰗼  Quit', ':qa<CR>'),
      }

      dashboard.section.footer.val = 'leat fingies'

      dashboard.config.opts.noautocmd = true

      alpha.setup(dashboard.config)
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    enabled = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      render = 'background',
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_var_usage = true,
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },
  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = '<M-h>',
          down = '<M-j>',
          up = '<M-k>',
          right = '<M-l>',
          last_active = '<M-\\>',
          next = '<M-Space>',
        },
      }

      local function tmux_command(command)
        local tmux_socket = vim.fn.split(vim.env.TMUX, ',')[1]
        return vim.fn.system('tmux -S ' .. tmux_socket .. ' ' .. command)
      end

      local nvim_tmux_nav_group = vim.api.nvim_create_augroup('NvimTmuxNavigation', {})

      vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
        group = nvim_tmux_nav_group,
        callback = function() tmux_command 'set-option -p @is_vim yes' end,
      })

      vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
        group = nvim_tmux_nav_group,
        callback = function() tmux_command 'set-option -p -u @is_vim' end,
      })
    end,
  },

  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    version = '*', -- use the latest stable version
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>-',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      --      {
      -- Open in the current working directory
      --        '<leader>cw',
      --        '<cmd>Yazi cwd<cr>',
      --        desc = "Open the file manager in nvim's working directory",
      --      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
        open_file_in_vertical_split = '<c-g>',
        open_file_in_horizontal_split = '<c-v>',
        replace_in_directory = '<c-x>',
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
