vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.env.PATH = vim.fn.expand("~/.cargo/bin") .. ":" .. vim.env.PATH
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
require("lazy").setup("plugins")
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})

if not vim.g.lazy_did_setup then
  require("lazy").setup(plugins, opts)
  vim.g.lazy_did_setup = true
end

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
