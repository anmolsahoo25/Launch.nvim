local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = {'branch'},
      lualine_b = {'filename'},
      lualine_c = {'diagnostics', {'tabs', mode = 0}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'location'}
    },
  }
end

return M
