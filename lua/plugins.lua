return {
  -- theme
  --{
  --  "neanias/everforest-nvim",
  --  -- Optional; default configuration will be d if setup isn't called.
  --  config = function()
  --    require("everforest").setup()
  --  end,
  --},

  {
    'shaunsingh/nord.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
  },

  --{'nyoom-engineering/oxocarbon.nvim'},

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
      require("lualine").setup({
        options = {
          -- ... other configuration
          theme = "auto", -- Can also be "auto" to detect automatically.
        }
      })
    end,
  },

  "christoomey/vim-tmux-navigator", --用ctl-hjkl定位窗口

  "HiPhish/nvim-ts-rainbow2",

  {
    "lewis6991/gitsigns.nvim", --左侧git提示
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end,
  },

  {
    'm4xshen/hardtime.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim", -- optional
    },
    config = function()
      require('hardtime').setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
      })
    end,
  }
}
