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
    --'shaunsingh/nord.nvim',
    --"Mofiqul/dracula.nvim",
    --"rebelot/kanagawa.nvim",
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      --vim.cmd([[colorscheme nord]])
      --vim.cmd([[colorscheme dracula]])
      vim.cmd([[colorscheme tokyonight]])
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
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
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
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>d", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "<leader>D", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "<leader>r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "<leader>R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          markdown = { "mdformat" },
          python = { "isort", "black" },
          rust = { "rustfmt" },
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>l", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "toggle zen-mode" }),
      plugins = {
        tmux = { enabled = true }, -- disables the tmux statusline
      }
    },
  },
}
