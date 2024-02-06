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
  },
  {
    name = "AtlasClose",
    opts = {
      desc = "atlas: close",
      nargs = "?",
      complete = "dir",
    },
    command = function()
      require("atlas.view").close()
    end
  },
  {
    name = "AtlasToggle",
    opts = {
      desc = "atlas: toggle",
      nargs = "?",
      complete = "dir",
    },
    command = function()
      require("atlas.view").toggle()
    end
  },
}

function M.setup()
  for _, cmd in ipairs(commands) do
    local copts = vim.tbl_extend("force", cmd.opts, { force = true })
    vim.api.nvim_create_user_command(cmd.name, cmd.command, copts)
  end
end

return M
