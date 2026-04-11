-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "X", '"_X')
vim.opt.virtualedit = "all"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.sidescrolloff = 10
