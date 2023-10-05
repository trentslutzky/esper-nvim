local buffers_section = {
  title = "Buffers",
  icon = "->",
  draw = function(ctx)
    return "TEST"
  end
}

-- TODO: figure out why nvim crashes when buffer deleted with sidebar open

local opts = {
  open = false,
  side = "right",
  sections = {
    "files",
    buffers_section,
    "todos",
  },
  datetime = { format = "%a %b %d, %H:%M" },
}

require('sidebar-nvim').setup(opts)
