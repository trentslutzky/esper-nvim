local term = require('util').term

local set = vim.opt
local cmd = vim.cmd

cmd('syntax on')
set.termguicolors = true

cmd('colorscheme onehalfdark')
set.background = 'dark'

local function gen_highlghts(highlights)
  for name,h in pairs(highlights) do
    local command = "hi " .. name
    if h["fg"] ~= nil then
      command = command .. " guifg=" .. h["fg"]
    end
    if h["bg"] ~= nil then
      command = command .. " guibg=" .. h["bg"]
    end
    if h["gui"] ~= nil then
      command = command .. " gui=" .. h["gui"]
    end
    cmd(command)
  end
end

local bg_0 = "#151515"
local bg_1 = "#222222"
local bg_2 = "#333333"
local bg_3 = "#444444"
local bg_4 = "#666666"

local highlghts = {

  Normal = {
    bg = bg_0
  },

  NormalFloat = {
    bg = bg_1,
    fg = term(4),
  },

  -- bufferline

  BufferLineFill = {
    bg = bg_0,
  },

  BufferLineBackground = {
    fg = bg_4,
    bg = bg_1,
  },

  BufferLineCloseButton = {
    fg = bg_4,
    bg = bg_1,
  },

  BufferLineCloseButtonSelected = {
    fg = term(2),
    bg = bg_2,
  },

  BufferLineBufferSelected = {
    fg = term(2),
    bg = bg_2,
    gui = "bold",
  },

  BufferLineModified = {
    fg = term(2),
    bg = bg_1,
  },

  BufferLineModifiedSelected = {
    fg = term(2),
    bg = bg_2,
  },

  BufferLineSeparator = {
    fg = bg_0,
    bg = bg_1,
  },

  BufferLineSeparatorVisible = {
    fg = bg_0,
    bg = bg_1,
  },

  BufferLineSeparatorSelected = {
    fg = bg_0,
    bg = bg_2,
  },

  -- telescope

  TelescopeNormal = {
    bg = bg_1,
  },

  TelescopeBorder = {
    fg = bg_1,
    bg = bg_1,
  },

  TelescopePreviewNormal = {
    bg = bg_2,
  },

  TelescopePreviewTitle = {
    fg = term(2),
    bg = bg_2,
    gui = "bold",
  },

  TelescopeResultsTitle = {
    fg = term(3),
    bg = bg_1,
    gui = "bold",
  },

  TelescopePreviewBorder = {
    fg = bg_2,
    bg = bg_2,
  },

  TelescopePromptNormal = {
    bg = bg_3,
  },

  TelescopePromptBorder = {
    bg = bg_3,
    fg = bg_3,
  },

  TelescopePromptTitle = {
    bg = bg_3,
    fg = term(3),
  },

  TelescopePromptCounter = {
    bg = bg_3,
    fg = term(3),
  },

  -- lsp diagnostics

  DiagnosticError = { fg = term(1) },
  DiagnosticWarn = { fg = term(1) },
  DiagnosticHint = { fg = term(1) },
  DiagnosticInfo = { fg = term(1) },

  -- search highlighting

  HlSearchNear = {
    fg = term(0),
    bg = term(4),
  },

  HlSearchLens = {
    fg = term(0),
    bg = term(5),
  },

  HlSearchLensNear = {
    fg = term(0),
    bg = term(4),
  },

  -- cursorline

  Cursorline = {
    gui = "bold",
    bg = bg_1,
  },

  CursorlineNr = {
    gui = "bold",
    fg = term(7),
  },

  -- line numbers

  LineNr = {
    gui = "bold",
    bg = "none",
    fg = bg_3,
  },
  LineNrAbove = {
    gui = "bold",
    bg = "none",
    fg = bg_2,
  },
  LineNrBelow = {
    gui = "bold",
    bg = "none",
    fg = bg_2,
  },

  -- nvim tree

  NvimTreeNormal = {
    bg = bg_1,
  },

  NvimTreeCursorLine = {
    bg = bg_2,
  },

  NvimTreeWinSeparator = {
    bg = bg_1,
    fg = bg_1,
  },

  -- octo

  OctoEditable = {
    bg = bg_1,
  },

  OctoIssueId = {
    bg = bg_1,
    fg = term(3),
  },

  OctoStateOpenFloat = {
    bg = bg_1,
    fg = term(2),
  },

  OctoStateClosedFloat = {
    bg = bg_1,
    fg = term(1),
  },

  OctoStateMergedFloat = {
    bg = bg_1,
    fg = term(4),
  },

  OctoUser = {
    bg = bg_2,
    fg = term(4),
  },

  OctoUserViewer = {
    bg = bg_2,
    fg = term(2),
  },

}

-- gitsigns
cmd('hi GitSignsAdd cterm=bold gui=bold guibg=none guifg='..term(2))
cmd('hi GitSignsAddNr cterm=bold gui=bold guibg=none guifg='..term(2))
cmd('hi GitSignsChange cterm=bold gui=bold guibg=none guifg='..term(3))
cmd('hi GitSignsChangeNr cterm=bold gui=bold guibg=none guifg='..term(3))
cmd('hi GitSignsDelete cterm=bold gui=bold guibg=none guifg='..term(1))
cmd('hi GitSignsDeleteNr cterm=bold gui=bold guibg=none guifg='..term(1))

-- cmp
cmd('hi CmpItmAbbrMatch guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrMatchFuzzy guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrFunction guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrMethod guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrVariable guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrMatch guibg=NONE guifg=#123456')

gen_highlghts(highlghts)

