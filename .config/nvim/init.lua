local manual_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
if vim.loop.fs_stat(manual_path) then
    vim.opt.rtp:prepend(manual_path)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_matchparen = 1

require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false

if vim.g.neovide then
    vim.g.neovide_input_ime = true
end

-- indent settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.guifont = "UDEV Gothic 35NFLG:h14"

-- keybinds
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.opt.clipboard = "unnamedplus"

vim.filetype.add({
    extension = {
        slint = "slint",
    },
})
