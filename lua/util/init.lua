local M = {}

M.term = function(num)
  local key = "terminal_color_"..num
  return vim.g[key] and vim.g[key] or default
end

return M
