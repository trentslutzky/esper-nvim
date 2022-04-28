local term = require('util').term

require('gitsigns').setup {}
require('nvim-web-devicons').setup{default=true}

require('telescope').setup{}

require('nvim-autopairs').setup{}

require('modules.lsp')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts, client_id)
  if vim.tbl_isempty(line_diagnostics) then return end

  --local echostr = 'echohl Normal | echon " > " | echohl Error | '
  local echostr = ''
  for _, diagnostic in ipairs(line_diagnostics) do
    local sev = diagnostic.severity
    local mes = diagnostic.message
    if sev == 1 then
      echostr = echostr .. 'echohl DiagnosticError | echon "  " |'
    elseif sev == 2 then
      echostr = echostr .. 'echohl DiagnosticWarn | echon "  " |'
    elseif sev == 3 then
      echostr = echostr .. 'echohl DiagnosticInfo | echon "  " |'
    elseif sev == 4 then
      echostr = echostr .. 'echohl DiagnosticHint | echon "  " |'
    end
    echostr = (echostr .. " echon '" .. mes .. "' |")
  end
  --print(echostr)
  vim.cmd(echostr)
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

require('modules.feline')

require("bufferline").setup{options = {
  diagnostics = false,
  show_close_icon = false,
  offsets = {{
    filetype = "NvimTree",
    text = ""
  }},
}}
-- colors
vim.cmd('hi BufferLineFill guibg=#202020')

require('cinnamon').setup{
  extra_keymaps = true,
}

require("nvim-tree").setup {}
-- nvim tree colors
vim.cmd('hi NvimTreeNormal guibg=#101010')

require("indent_blankline").setup {
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  filetype_exclude = {"help","dashboard"},
}

require("colorizer").setup()

require("twilight").setup{}

require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
  handle = { color = term(0) },
  marks = {
    Search = { color = term(2) },
     Error = { color = term(1) },
      Warn = { color = term(3) },
      Info = { color = term(5) },
      Hint = { color = term(5) },
      Misc = { color = term(15) },
  },
})

require'nvim-lastplace'.setup{}
