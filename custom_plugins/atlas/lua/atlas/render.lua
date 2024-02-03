local view = require("atlas.view")

local namespace_id = vim.api.nvim_create_namespace("AtlasHighlights")

local M = {}

local function set_mod(is_mod)
  vim.api.nvim_buf_set_option(view.View.bufnr, "modifiable", is_mod)
end

function M.draw_section(sec_dat)
  set_mod(true)
  vim.api.nvim_buf_set_lines(view.View.bufnr, 0, -1, false, {"Buffers"})
  vim.api.nvim_buf_add_highlight(view.View.bufnr, namespace_id, "Error", 0, 0, 6)
  set_mod(false)
end

return M
