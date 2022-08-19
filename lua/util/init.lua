local Job = require "plenary.job"

local M = {}

M.term = function(num)
  -- grabs a terminal color (for colorscheme)
  local key = "terminal_color_"..num
  return vim.g[key] and vim.g[key] or 'none'
end

-- Source: 🔭 utils: https://git.io/JK3ht
M.get_os_command_output = function(cmd, cwd)
  if type(cmd) ~= "table" then
    print "Utils: [get_os_command_output]: cmd has to be a table"
    return {}
  end
  local command = table.remove(cmd, 1)
  local stderr = {}
  local stdout, ret = Job
    :new({
      command = command,
      args = cmd,
      cwd = cwd,
      on_stderr = function(_, data)
        table.insert(stderr, data)
      end,
    })
    :sync()
  return stdout, ret, stderr
end

return M
