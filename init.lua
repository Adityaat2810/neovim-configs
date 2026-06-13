vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.env")

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

require("lazy").setup({
  require("plugins.catppuccin"),
  require("plugins.neo-tree"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.lualine"),
})
