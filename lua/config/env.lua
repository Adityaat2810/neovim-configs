local cargo_bin = vim.fn.expand("~/.cargo/bin")

if not vim.env.PATH:find(cargo_bin, 1, true) then
  vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
end
