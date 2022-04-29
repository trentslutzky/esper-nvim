local M = {}

M.term = function(num)
  -- grabs a terminal color (for colorscheme)
  local key = "terminal_color_"..num
  return vim.g[key] and vim.g[key] or 'none'
end

return M
