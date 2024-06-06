-- 语法高亮模块

require'nvim-treesitter.configs'.setup {
  -- 添加不同语言
  ensure_installed = { "c", "lua", "vim", "bash", "regex","python", "cpp", "markdown", "markdown_inline"},

  highlight = {
    enable = true,
    disable = {"markdown"},
  },
  indent = { enable = true },


  -- 区分括号不同颜色
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }

}
