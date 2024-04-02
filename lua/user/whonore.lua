local M = {
  "whonore/Coqtail"
}

function M.config()
  local wk = require "which-key"

  vim.g.coqtail_nomap = 1

  local mappings = {
    cl = { ":CoqToLine<CR>", "Coq To Line" }
  }

  local opts = {
    mode = "n",
    prefix = "<leader>"
  }

  wk.register(mappings, opts)
end

return M
