
local set = vim.opt
local cmd = vim.cmd

local lighten = require('util').lighten

cmd('syntax on')
set.termguicolors = true

local bg_0 = "#000000"
local bg_1 = "#1f1f1f"
local bg_2 = "#333333"
local bg_3 = "#555555"

local foreground = "#c5c8c6"
local foreground1 = "#b1b3b2"
local foreground2 = "#7e807f"

local accent_red = "#E36049"
local accent_green = "#aed466"
local accent_yellow = "#ffbc4a"
local accent_blue = "#7FACCA"
local accent_magenta = "#7F81CA"
local accent_cyan = "#727272"

local red = "#cacccb"
local green = "#b1b3b2"
local yellow = "#979998"
local magenta = "#D7D9D8"
local blue = "#7e807f"
local cyan = "#727372"

local buffer_line_background = bg_1

local telescope_border = accent_yellow

local highlghts = {

  Normal = {fg = foreground, bg = bg_0 },

  String = { fg = accent_green },
  Function = { fg = accent_blue },
  Number = { fg = accent_yellow },
  Statement = { fg = accent_magenta },
  Operator = { fg = accent_yellow, },
  Conditional = { fg = accent_yellow },
  Repeat = { fg = accent_yellow },
  Constant = { fg = foreground },

  Special = { fg = accent_blue },
  Title = { fg = accent_blue },

  Character = { fg = yellow },
  Float = { fg = yellow },
  FloatBorder = { bg = bg_0 },
  Boolean = { fg = yellow },
  PreProc = { fg = yellow },
  PreCondit = { fg = yellow },
  Type = { fg = yellow },
  Typedef = { fg = yellow },
  Structure = { fg = yellow },
  StorageClass = { fg = yellow },
  Include = { fg = magenta },
  Exception = { fg = magenta },
  Define = { fg = magenta },
  Label = { fg = magenta },
  Macro = { fg = magenta },
  Identifier = { fg = red },
  Keyword = { fg = red },
  NonText = { fg = bg_3 },
  Directory = { fg = accent_blue },
  htmlError = { fg = red },
  javaScriptError = { fg = red },
  Underlined = { fg = cyan },
  Todo = { bg = yellow, fg = bg_0 },
  SignColumn = { bg = bg_0 },

  MatchParen = { bg = accent_yellow, fg = bg_0 },

  Error = { fg = accent_red, bg = lighten(accent_red, -50) },
  ErrorMsg = { fg = accent_red, bg = lighten(accent_red, -50), bg=bg0 },
  NvimInternalError = { fg = accent_red, bg = lighten(accent_red, -50) },

  DiffAdd = { bg = lighten(accent_green, -40), fg = foreground },
  DiffDelete = { bg = lighten(accent_red, -40), fg = foreground },
  DiffChange = { bg = lighten(accent_yellow, -40), fg = foreground },

  StatusLine = { bg = bg_1, gui="none" },
  StatusLineNC = { bg = bg_1, gui="none" },

  Visual = {
    bg = accent_yellow,
    fg = bg_0,
  },

  Pmenu = {
    fg = foreground,
    bg = bg_2
  },

  CmpItemKindDefault = {
    fg = accent_yellow
  },

  NormalFloat = {
    bg = bg_1,
    fg = blue,
  },

  -- telescope

  TelescopeNormal = {
    bg = bg_1,
  },

  TelescopeSelection = {
    bg = bg_2,
  },

  TelescopeBorder = {
    fg = telescope_border,
    bg = bg_0,
  },

  TelescopePreviewNormal = {
    bg = bg_1,
  },

  TelescopePreviewLine = {
    bg = bg_3,
    fg = accent_blue,
    gui = "bold",
  },

  TelescopePreviewTitle = {
    fg = telescope_border,
    bg = bg_0,
    gui = "bold",
  },

  TelescopeResultsTitle = {
    fg = telescope_border,
    bg = bg_0,
    gui = "bold",
  },

  TelescopeResultsNormal = {
    bg = bg_0,
  },

  TelescopePreviewBorder = {
    fg = telescope_border,
    bg = bg_0,
  },

  TelescopePromptNormal = {
    bg = bg_0,
  },

  TelescopePromptBorder = {
    bg = bg_0,
    fg = telescope_border,
  },

  TelescopePromptTitle = {
    bg = bg_0,
    fg = telescope_border,
  },

  TelescopePromptCounter = {
    bg = bg_0,
    fg = accent_green,
  },

  -- lsp diagnostics
  DiagnosticError = {
    fg = accent_red,
    bg = "none",
  },

  DiagnosticUnderlineError = {
    gui = "underline",
    guisp = accent_red
  },

  DiagnosticWarn = { fg = accent_yellow, bg = "none" },
  DiagnosticHint = { fg = accent_yellow, bg = "none" },
  DiagnosticInfo = { fg = accent_green, bg = "none" },
  DiagnosticUnnecessary = { bg = "none", gui = "underline", guisp = accent_yellow },

  -- search highlighting

  Search = {
    bg = bg_2,
    fg = accent_yellow,
  },

  HlSearchNear = {
    fg = accent_yellow,
    bg = bg_0,
  },

  HlSearchFloat = {
    fg = magenta,
    bg = bg_0,
  },

  HlSearchLens = {
    fg = magenta,
    bg = bg_0,
  },

  HlSearchLensNear = {
    fg = accent_green,
    bg = bg_2,
  },

  -- cursorline

  Cursorline = {
    gui = "bold",
    bg = bg_1,
  },

  CursorlineNr = {
    gui = "bold",
    fg = blue,
    bg = bg_1,
  },

  -- line numbers

  LineNr = {
    gui = "bold",
    bg = bg_0,
    fg = foreground1,
  },

  LineNrAbove = {
    gui = "bold",
    bg = bg_0,
    fg = foreground2,
  },

  LineNrBelow = {
    gui = "bold",
    bg = bg_0,
    fg = foreground2,
  },

  -- nvim tree

  NvimTreeNormal = {
    bg = bg_0,
    fg = foreground,
  },

  NvimTreeRootFolder = {
    fg = accent_blue,
  },

  NvimTreeFolderName = {
    fg = foreground,
  },

  NvimTreeFolderIcon = {
    fg = accent_yellow,
  },

  NvimTreeCursorLine = {
    bg = bg_2,
  },

  NvimTreeWinSeparator = {
    bg = bg_0,
    fg = accent_yellow,
  },

  -- octo

  OctoEditable = {
    bg = bg_1,
  },

  OctoIssueId = {
    bg = bg_1,
    fg = yellow,
  },

  OctoStateOpenFloat = {
    bg = bg_1,
    fg = green,
  },

  OctoStateClosedFloat = {
    bg = bg_1,
    fg = red,
  },

  OctoStateMergedFloat = {
    bg = bg_1,
    fg = cyan,
  },

  OctoUser = {
    bg = bg_2,
    fg = cyan,
  },

  OctoUserViewer = {
    bg = bg_2,
    fg = green,
  },

  -- indentline

  IndentBlankLineChar = {
    fg = bg_1
  },

  IblIndent = {
    fg = bg_1
  },

  -- comments

  Comment = {
    fg = foreground2,
  },

  -- scrollbar

  ScrollbarHandle = {
    bg = bg_1
  },

  ScrollbarCursor = {
    bg = bg_1
  },

  ScrollbarErrorHandle = {
    bg = bg_1
  },

  ScrollbarSearchHandle = {
    bg = bg_1
  },

  ScrollbarInfoHandle = {
    bg = bg_1
  },

  ScrollbarHintHandle = {
    bg = bg_1
  },

  ScrollbarWarnHandle = {
    bg = bg_1
  },

  ScrollbarMiscHandle = {
    bg = bg_1
  },

  DashboardCenter = {
    fg = green,
  },

  DashboardHeader = {
    fg = yellow
  },

  VertSplit = {
    fg = bg_2,
    bg = bg_1,
  },

  Floaterm = {
    bg = bg_0,
  },

  FloatermBorder = {
    bg = bg_0,
  },

  FoldColumn = {
    fg = accent_blue,
    bg = bg_0,
  },

  Folded = {
    fg = accent_blue,
    bg = lighten(accent_blue, -50),
  },

  GitSignsAdd = { fg = accent_green, bg = bg_0 },
  GitSignsChange = { fg = accent_yellow, bg = bg_0 },
  GitSignsDelete = { fg = accent_red, bg = bg_0 },

}

-- gitsigns
-- cmd('hi GitSignsAdd cterm=bold gui=bold guibg=none guifg='..accent_green)
-- cmd('hi GitSignsAddNr cterm=bold gui=bold guibg=none guifg='..accent_green)
-- cmd('hi GitSignsChange cterm=bold gui=bold guibg=none guifg='..accent_yellow)
-- cmd('hi GitSignsChangeNr cterm=bold gui=bold guibg=none guifg='..accent_yellow)
-- cmd('hi GitSignsDelete cterm=bold gui=bold guibg=none guifg='..accent_red)
-- cmd('hi GitSignsDeleteNr cterm=bold gui=bold guibg=none guifg='..accent_red)

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
    if h["guisp"] ~= nil then
      command = command .. " guisp=" .. h["guisp"]
    end
    cmd(command)
  end
end

gen_highlghts(highlghts)

return {
  bg_0 = bg_0,
  bg_1 = bg_1,
  bg_2 = bg_2,
  bg_3 = bg_3,

  foreground = foreground,
  foreground1 = foreground1,
  foreground2 = foreground2,

  red = red,
  green = green,
  yellow = yellow,
  blue = blue,
  magenta = magenta,
  cyan = cyan,

  accent_green = accent_green,
  accent_yellow = accent_yellow,
  accent_red = accent_red,
  accent_blue = accent_blue,
}
