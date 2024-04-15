return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    vim.keymap.set("n", "<leader>nl", function()
      require("noice").cmd "last"
    end, { desc = "Noice Last Message" })
    vim.keymap.set("n", "<leader>nh", function()
      require("noice").cmd "history"
    end, { desc = "Noice History" })
    vim.keymap.set("n", "<leader>na", function()
      require("noice").cmd "all"
    end, { desc = "Noice All" })
    vim.keymap.set("n", "<leader>nd", function()
      require("noice").cmd "dismiss"
    end, { desc = "Dismiss All" })
  end,
}
