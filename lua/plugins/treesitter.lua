return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "python",
      "go",
      "cpp",
      "rust",
      "bash",
      "json",
      "yaml",
      "markdown",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        node_decremental = "<M-space>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
