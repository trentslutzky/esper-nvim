local view = require("atlas.view")

local M = {}

M.namespace_id = vim.api.nvim_create_namespace("AtlasHighlights")

local DEFAULT_HIGHLIGHTS = {
  AtlasSectionTitle = "guifg=#7FACCA",
}

local DEFAULT_LINKS = {
  AtlasNormal = "Normal",
  AtlasNonText = "VertSplit",
  AtlasCursorLine = "CursorLine",
}

function M.setup()

  vim.api.nvim_win_set_hl_ns(view.get_winnr(), M.namespace_id)

  -- non-linked
  for k, d in pairs(DEFAULT_HIGHLIGHTS) do
    vim.api.nvim_command("hi def " .. k .. " " .. d)
  end
  -- default links
  for from, to in pairs(DEFAULT_LINKS) do
    vim.api.nvim_command("hi def link " .. from .. " " .. to)
  end

  vim.api.nvim_set_hl(M.namespace_id, "Normal", {link="AtlasNormal"})
  vim.api.nvim_set_hl(M.namespace_id, "NonText", { link="AtlasNonText" })
  vim.api.nvim_set_hl(M.namespace_id, "CursorLine", { link="AtlasCursorLine" })
end

return M
