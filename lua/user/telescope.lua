local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { 
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<leader>f", "<cmd>Telescope git_files<cr>", opts)
  keymap("n", "<leader>g", "<cmd>Telescope grep_string<cr>", opts)
  keymap("n", "<leader>l", "<cmd>Telescope live_grep<cr>", opts)
  keymap("n", "<leader>p", "<cmd>Telescope buffers<cr>", opts)
  keymap("n", "<leader>q", "<cmd>Telescope diagnostics<cr>", opts)

  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },

      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "insert",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      diagnostics = {
        enable_preview = true,
        initial_mode = "normal",
        theme = "dropdown"
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
