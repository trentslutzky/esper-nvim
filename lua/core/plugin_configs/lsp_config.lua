
require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- require("lspconfig").lua_ls.setup {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = {'vim'},
--       }
--     }
--   }
-- }
-- require("lspconfig").pyright.setup {}
-- require("lspconfig").pylsp.setup {
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           maxLineLength = 999
--         },
--         mccabe = {
--           enabled = false
--         }
--       }
--     }
--   }
-- }
-- require("lspconfig").eslint.setup {}
-- require("lspconfig").tsserver.setup{}
-- require("lspconfig").vuels.setup {}
-- require("lspconfig").cssls.setup{}
-- require'lspconfig'.sourcekit.setup{} -- for swift
--


function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts, client_id)

  local echostr = 'echon "errors" |'
  local num_err = 0
  local mes = ''

  for _, diagnostic in ipairs(line_diagnostics) do
    num_err = num_err + 1
    if num_err > 1 then
      echostr = echostr .. " | "
    end
    echostr = echostr .. " echohl Normmal | echon ' " .. num_err .. "' | "
    local sev = diagnostic.severity
    mes = diagnostic.message
    if sev == 1 then
      echostr = echostr .. 'echohl DiagnosticError | echon "  " |'
    elseif sev == 2 then
    echostr = echostr .. 'echohl DiagnosticWarn | echon "  " |'
    elseif sev == 3 then
      echostr = echostr .. 'echohl DiagnosticInfo | echon "  " |'
    elseif sev == 4 then
      echostr = echostr .. 'echohl DiagnosticHint | echon "  " |'
    end
    mes = mes:gsub('"',""):gsub("'",""):gsub("`",""):gsub(" |","")
    echostr = echostr .. ' echon "' .. mes .. '"'
  end

  if num_err > 0 then
    print(mes)
  end
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
