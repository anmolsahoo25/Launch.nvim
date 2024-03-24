local M = {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    }
}

function M.config()
  local mason_null_ls = require "mason-null-ls"

  mason_null_ls.setup {
    ensure_installed = {"ocamlformat"},
    automatic_installation = false,
    handlers = {}
  }
end

return M
