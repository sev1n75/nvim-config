vim.g.mapleader = " "

local keymap = vim.keymap

-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- clear jumplists
keymap.set("n", "<leader>cl", "<cmd>clearjumps<CR>")

keymap.set('n', '<leader>ut', '<cmd>lua ToggleTransparentBackground()<CR>')

local transparent_background = true

function ToggleTransparentBackground()
  transparent_background = not transparent_background
  require("catppuccin").setup {
    transparent_background = transparent_background,
  }
  vim.cmd([[colorscheme catppuccin]])
end
