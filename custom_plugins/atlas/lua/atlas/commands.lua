local M = {}

local commands = {
  {
    name = "AtlasOpen",
    opts = {
      desc = "atlas: open",
      nargs = "?",
      complete = "dir",
    },
    command = function()
      require("atlas.view").open()
    end
  }
}

function M.setup()
  for _, cmd in ipairs(commands) do
    local copts = vim.tbl_extend("force", cmd.opts, { force = true })
    vim.api.nvim_create_user_command(cmd.name, cmd.command, copts)
  end
end

return M
