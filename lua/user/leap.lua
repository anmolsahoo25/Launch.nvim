local M = {
  "ggandor/leap.nvim",
  lazy = false
}

function M.config()
  local leap = require('leap')

  leap.create_default_mappings()
end

return M
