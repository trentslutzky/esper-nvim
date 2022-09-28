local term = require('util').term

require('gitsigns').setup({})
--
require('nvim-web-devicons').setup{default=true}

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

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
  update_in_insert = true,
  severity_sort = false,
})

-- autocmd function to print diagnostics when hover
function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts, client_id)

  local echostr = ''
  local num_err = 0
  local mes = ''
  for _, diagnostic in ipairs(line_diagnostics) do
    num_err = num_err + 1
    local sev = diagnostic.severity
    mes = diagnostic.message
    if sev == 1 then
      echostr = echostr .. 'echohl DiagnosticError | echon "  " |'
    elseif sev == 2 then
    echostr = echostr .. 'echohl DiagnosticWarn | echon "  " |'
    elseif sev == 3 then
      echostr = echostr .. 'echohl DiagnosticInfo | echon "  " |'
    elseif sev == 4 then
      echostr = echostr .. 'echohl DiagnosticHint | echon "  " |'
    end
    --mes = mes:gsub('"',""):gsub("'",""):gsub("`","")
    --if string.len(echostr) < max_width then
    echostr = (echostr .. " echon '" .. mes .. "' |")
    --end
  end

  echostr = (" echohl Normmal | echon '" .. num_err .. " err: ' |" .. echostr)

  if num_err > 0 then
    print(mes)
    --vim.cmd(echostr)
  end
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

-- setup feline
require('modules.feline')

-- setup telescope
require('modules.telescope')

require("bufferline").setup{
  options = {
    diagnostics = false,
    show_close_icon = false,
    show_buffer_icons = false,
    separator_style = "slant",
    offsets = {{
      filetype = "NvimTree",
      text = "File Browser"
    }}
  },
}

require('cinnamon').setup{
  extra_keymaps = true,
  horizontal_scroll = false,
  centered = true,
  default_delay = 5,
}

require("nvim-tree").setup {
  view = {
    width = 40,
  },
  filters = {
    custom = {
      "^.git$",
      "^.github$",
      "^.git-crypt$",
      "^.mypy_cache$",
      "^__pycache__$"
    }
  }
}

require("indent_blankline").setup {
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  filetype_exclude = {"help","dashboard"},
}

require('hlslens').setup({
  auto_enable = false,
  calm_down = true,
  nearest_only = true,
  nearest_float_when = 'never'
})

require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
  marks = {
    Search = { color = term(2) },
     Error = { color = term(1) },
      Warn = { color = term(3) },
      Info = { color = term(4) },
      Hint = { color = term(4) },
      Misc = { color = term(15) },
  },
})

require'nvim-lastplace'.setup{}

require("modules.dashboard")

require('nvim_comment').setup()

require('numbers').setup({
  excluded_filetypes = {"help","dashboard","nvimtre","octo"},
})

require('gitlinker').setup()

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.filetype_to_parsername = "octo"

require("octo").setup({
  timeline_marker = "";
  timeline_indent = "4";
})

require("yanky").setup({
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
})

