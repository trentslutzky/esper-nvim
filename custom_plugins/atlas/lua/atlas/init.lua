local commands = require("atlas.commands")
local view = require("atlas.view")

local M = {}

function M.setup(opts)
  view.setup()
  commands.setup()
  if opts.open then
    view.open({focus=false})
  end
end

return M
