return {
  -- 语法高亮模块
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require 'nvim-treesitter.configs'.setup({
      -- 添加不同语言
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "regex", "python", "cpp", "markdown", "markdown_inline" },

      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        -- keymaps = {
        --   init_selection = "<leader>ss",
        --   node_incremental = "<leader>si",
        --   scope_incremental = "<leader>sc",
        --   node_decremental = "<leader>sd",
        -- },
      },
    })
  end,
}
