local opt = vim.opt

---- 显示
-- 行号
opt.relativenumber = true
opt.number = true

-- 防止包裹
opt.wrap = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap",
})

-- 光标行
opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })

-- 光标滚动
opt.scrolloff = 999

-- 默认新窗口右下
opt.splitright = true
opt.splitbelow = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark" -- set this to dark or light

---- 其他
-- 缩进
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- 编辑
opt.virtualedit = "block"

-- 启用鼠标
-- opt.mouse:append("a")

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 搜索
opt.ignorecase = true
opt.smartcase = true
