return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
    {
      "s1n7ax/nvim-window-picker",
      config = function()
        require("window-picker").setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              buftype = { "terminal", "quickfix" },
            },
          },
        }
      end,
    },
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      hide_root_node = true,
      default_component_configs = {
        indent = {
          with_markers = false,
          with_expanders = true,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    }

    vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>")
  end,
}
