vim.g.mapleader = " "

local keymap = vim.keymap

-- ----------------视觉模式----------------------- --
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ----------------正常模式----------------------- --
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>")

-- ----------------插件----------------------- --
keymap.set("n", "<leader>l", "<cmd>tabnext<CR>")
keymap.set("n", "<leader>h", "<cmd>tabprevious<CR>")
keymap.set("n", "<leader>x", ":bdelete<CR>")

-- noice-nvim
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
