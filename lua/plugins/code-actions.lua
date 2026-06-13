return {
  "rachartier/tiny-code-action.nvim",
  keys = {
    {
      "<leader>ca",
      function()
        require("tiny-code-action").code_action()
      end,
      mode = { "n", "x" },
      desc = "LSP: code actions UI",
    },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    backend = "vim",
    picker = "telescope",
  },
}
