local highlights = require("atlas.highlights")
local view = require("atlas.view")

local M = {}

function M.setup(opts)
  highlights.setup()
  M.draw_section()
end

function M.draw_section()
  local bufnr = view.View.bufnr
  vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"   Buffers"})
  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  vim.api.nvim_buf_add_highlight(bufnr, highlights.namespace_id, "AtlasSectionTitle", 0, 0, -1)
end


return M
