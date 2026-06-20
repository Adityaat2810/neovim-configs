local cargo_bin = vim.fn.expand("~/.cargo/bin")
local go_bin = vim.fn.expand("~/go/bin")

if not vim.env.PATH:find(cargo_bin, 1, true) then
  vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
end

if not vim.env.PATH:find(go_bin, 1, true) then
  vim.env.PATH = go_bin .. ":" .. vim.env.PATH
end
