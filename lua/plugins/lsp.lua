local ensure_installed = {
  "lua_ls",
  "clangd",
  "pyright",
  "ts_ls",
  "gopls",
  "rust_analyzer",
}

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  clangd = {},
  pyright = {},
  ts_ls = {},
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        gofumpt = true,
        staticcheck = true,
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "hrsh7th/cmp-nvim-lsp",
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = ensure_installed,
        automatic_enable = ensure_installed,
      },
    },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

    if has_cmp_lsp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local lsp_attach_group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = lsp_attach_group,
      callback = function(event)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = event.buf,
            silent = true,
            desc = desc,
          })
        end

        map("n", "gd", vim.lsp.buf.definition, "LSP: go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "LSP: go to declaration")
        map("n", "gr", vim.lsp.buf.references, "LSP: list references")
        map("n", "gi", vim.lsp.buf.implementation, "LSP: go to implementation")
        map("n", "K", vim.lsp.buf.hover, "LSP: hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: rename symbol")
        map({ "n", "v" }, "<leader>cA", vim.lsp.buf.code_action, "LSP: builtin code action")
        map("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, "LSP: format buffer")
      end,
    })

    vim.diagnostic.config({
      severity_sort = true,
      float = {
        border = "rounded",
      },
      signs = true,
      underline = true,
      virtual_text = true,
    })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnostics: previous" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnostics: next" })
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Diagnostics: open float" })

    for server_name, server_config in pairs(servers) do
      server_config.capabilities = vim.tbl_deep_extend(
        "force",
        {},
        capabilities,
        server_config.capabilities or {}
      )
      vim.lsp.config(server_name, server_config)
    end
  end,
}
