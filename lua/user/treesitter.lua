local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {{"nvim-treesitter-textobjects"}, {"nvim-treesitter-textsubjects"}}
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "lua",
      "markdown", 
      "markdown_inline",
      "bash",
      "python",
      "ocaml",
      "ocaml_interface",
      "c",
      "cpp"},
    highlight = { enable = true },
    indent = { enable = false },
    textsubjects = {
        enable = true,
        prev_selection = ',',
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
    textobjects = {
      swap = {
        enable = true,
        swap_next = {
          ["<leader>s"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>a"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = false,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[s"] = { query = "@scope", query_group = "locals", desc = "Prev scope" },
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        }
      },
    }
  }
end

return M
