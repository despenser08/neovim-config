return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match "error" and " " or " "
        return " " .. icon .. count
      end,
      offsets = { { filetype = "neo-tree" } },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>to", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
  end,
}
