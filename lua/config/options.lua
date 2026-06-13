local options = {
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
