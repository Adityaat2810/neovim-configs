return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  keys = {
    {
      "<leader>n",
      "<cmd>Neotree filesystem reveal left<cr>",
      desc = "Reveal current file in Neo-tree",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    default_component_configs = {
      icon = {
        enabled = true,
      },
    },
  },
}
