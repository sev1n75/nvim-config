local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
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
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nord]])
    end,
  },

   --{'nyoom-engineering/oxocarbon.nvim'},

   {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

   {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    }
  },

  "christoomey/vim-tmux-navigator", --用ctl-hjkl定位窗口

  "nvim-treesitter/nvim-treesitter",

  "HiPhish/nvim-ts-rainbow2",

  -- lsp
   {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },

  -- 自动补全
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path", --文件路径
  "L3MON4D3/LuaSnip", --snippets引擎 ，必要
  "hrsh7th/cmp-buffer",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  "akinsho/bufferline.nvim",  --buffer分割线
  "lewis6991/gitsigns.nvim",  --左侧git提示

  -- 文件检索
   {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'}
  },

   {
    'm4xshen/hardtime.nvim',
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim", -- optional
    }
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
require("lazy").setup(plugins, {})
