local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 锁进
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- 防止包裹
opt.wrap = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap",
})

-- 光标行
opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })

-- 启用鼠标
-- opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
vim.opt.background = "dark" -- set this to dark or light
--vim.cmd([[colorscheme everforest]])
--vim.cmd([[colorscheme nord]])
