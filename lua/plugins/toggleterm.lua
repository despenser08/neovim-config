return {
  "akinsho/toggleterm.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("toggleterm").setup {}
    vim.keymap.set("n", "<leader>T", "<cmd>ToggleTerm<CR>", { desc = "[T]oggle Terminal" })
  end,
}
