return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = { open_mapping = [[<c-/>]] },
  keys = {
    { "<leader>ft", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm" },
    { "<leader>fT", "<cmd>ToggleTerm direction=tab<cr>", desc = "ToggleTerm Tab" },
  },
}

