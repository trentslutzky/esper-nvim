local lspkind = require('lspkind')
local cmp = require'cmp'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

vim.opt.completeopt = "menuone,noselect"

cmp.setup({

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxWidth = 50
    })
  },

  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    }
  ),

  mapping = {
    ['<cr>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ['<right>'] = function(fallback)
      if vim.bo.buftype == 'prompt' then
        cmp.mapping.confirm {select = true}
      else
        fallback()
      end
    end,

    ['<esc>'] = function (fallback)
      cmp.mapping.abort()
      cmp.mapping.abort()
      cmp.mapping.abort()
      fallback()
    end,

    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<up>'] = cmp.mapping.select_prev_item(),
    ['<down>'] = cmp.mapping.select_next_item(),
  }

})

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- python
require('lspconfig')['pyright'].setup{}
-- lua
require('lspconfig')['sumneko_lua'].setup{
  settings = { Lua = {
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim','use'},
    },
  }},
}

require('lsp_signature').setup{
  bind = true,
  hint_enable = false,
  hint_prefix = "",
  floating_window = true,
  floating_window_above_cur_line = false,
  padding = " ",
  handler_opts = {
    border = "shadow"
  }
}

require('nvim-treesitter.configs').setup{
  ensure_instaled = {"lua","python","javscript","fish","html","css","json","vim","yaml"},
  highlight = {
    enabled = true,
  },
}
