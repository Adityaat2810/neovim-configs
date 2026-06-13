vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

local cargo_bin = vim.fn.expand("~/.cargo/bin")
if not vim.env.PATH:find(cargo_bin, 1, true) then
  vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins")
table.insert(plugins, require("plugins.catppuccin"))
table.insert(plugins, require("plugins.treesetter"))

require("lazy").setup(plugins)

vim.keymap.set("n", "<leader>n", "<cmd>Neotree filesystem reveal left<cr>", {
  desc = "Reveal current file in Neo-tree",
})
