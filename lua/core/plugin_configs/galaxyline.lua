local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
local colors = require('galaxyline.colors')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')
local term = require('util').term

-- provider
BufferIcon  = buffer.get_buffer_type_icon
BufferNumber = buffer.get_buffer_number
FileTypeName = buffer.get_buffer_filetype
-- Git Provider
GitBranch = vcs.get_git_branch
DiffAdd = vcs.diff_add            -- support vim-gitgutter vim-signify gitsigns
DiffModified = vcs.diff_modified  -- support vim-gitgutter vim-signify gitsigns
DiffRemove = vcs.diff_remove      -- support vim-gitgutter vim-signify gitsigns
-- File Provider
LineColumn = fileinfo.line_column
FileFormat = fileinfo.get_file_format
FileEncode = fileinfo.get_file_encode
FileSize = fileinfo.get_file_size
FileIcon = fileinfo.get_file_icon
FileName = fileinfo.get_current_file_name
FilePath = fileinfo.get_current_file_path
LinePercent = fileinfo.current_line_percent
ScrollBar = extension.scrollbar_instance
VistaPlugin = extension.vista_nearest
-- Whitespace
Whitespace = whitespace.get_item
-- Diagnostic Provider
DiagnosticError = diagnostic.get_diagnostic_error
DiagnosticWarn = diagnostic.get_diagnostic_warn
DiagnosticHint = diagnostic.get_diagnostic_hint
DiagnosticInfo = diagnostic.get_diagnostic_info
-- LSP
GetLspClient = lspclient.get_lsp_client

local colors = require('galaxyline.theme').default

function ViModeAlias(mode)
      local alias = {
        n = 'normal',
        i = 'insert',
        c= 'command',
        V= 'visual',
        [''] = 'visual',
        v ='visual',
        ['^V'] = "visual-block",
        c  = 'command',
        ['r?'] = ':confirm',
        rm = '--more',
        R  = 'replace',
        Rv = 'virtual',
        s  = 'select',
        S  = 'select',
        ['r']  = 'hit-enter',
        [''] = 'select',
        t  = 'terminal',
        ['!']  = 'shell',
      }
      return alias[mode]
end

function ViModeColor(mode)
  local color_alias = {
    n = term(4),
    i = term(2),
    c = term(5),
  }
  return color_alias[mode] or term(7)
end

local gsl = require('galaxyline').section.left


gsl[1] = {
  LeftSpacerViMode = {
    provider = function () 
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command(
        'hi GalaxyLeftSpacerViMode guifg=#123456 guibg=' 
        .. ViModeColor(vim_mode)
      )
      return ' '
    end,
  }
}

gsl[2] = {
ViMode = {
    provider = function()
      local vim_mode = vim.fn.mode()
      vim.api.nvim_command(
        'hi GalaxyViMode guifg=#123456 guibg=' 
        .. ViModeColor(vim_mode)
      )
      return ViModeAlias(vim_mode) .. ' '
    end,
    highlight = {
      nil,
      nil,
      'bold'
    }
},}

gsl[3] = {
  FileNameSpacer = {
    provider = function () return ' ' end
  }
}

gsl[4] = {
  FileIcon = {
    provider = fileinfo.get_file_icon,
  },
}

gsl[5] = {
  FileName = {
    provider = 'FileName',
  },
}

gsl[6] = {
  GitBranch = {
    provider = GitBranch,
    icon = " ",
    highlight = {
      term(8)
    }
  }
}
