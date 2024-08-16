local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = require("colors")

local theme = {
  Statusline = { bg = colors.bg_1 },
  WinBar = { bg = colors.bg_1 },
  ViMode = { bg = colors.bg_1, bold = true },
  GitBlame = { fg = colors.foreground2 },
  GitBranch = { fg = colors.foreground2, bg = colors.accent_green },
  CursorPos = { fg = colors.bg_1, bg = colors.accent_blue, bold = true },
}

local winbarComponentsFiletypeBlacklist = {
  "NvimTree",
  "telescope",
  "TelescopeResults",
  "TelescopeResult",
  "TelescopePreview",
  "bufferpane",
  "Atlas",
  "nil",
  "help",
  "startup",
  "NeogitStatus",
  "NeogitPopup",
  "neo-tree",
  "neo-tree-popup",
}

local winbarComponentBlacklist = function(showInNormalWindow)
  for _,v in ipairs(winbarComponentsFiletypeBlacklist) do
    if v == vim.bo.filetype then
      return showInNormalWindow
    end
  end

  return not showInNormalWindow
end

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,
    static = {
        mode_names = {
            n = "N",
            no = "N?",
            nov = "N?",
            noV = "N?",
            ["no\22"] = "N?",
            niI = "Ni",
            niR = "Nr",
            niV = "Nv",
            nt = "Nt",
            v = "V",
            vs = "Vs",
            V = " V_",
            Vs = "Vs",
            ["\22"] = " ^V",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I",
            ic = "Ic",
            ix = "Ix",
            R = "R",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T",
        },
        mode_colors = {
            n = colors.accent_blue,
            i = colors.accent_green,
            v = colors.foreground,
            V =  colors.foreground,
            ["\22"] =  colors.foreground,
            c =  colors.accent_yellow,
            s =  colors.accent_magenta,
            S =  colors.accent_magenta,
            ["\19"] =  colors.accent_magenta,
            R =  colors.accent_yellow,
            r =  colors.accent_yellow,
            ["!"] =  colors.accent_red,
            t =  colors.accent_red,
        }
    },
    provider = function(self)
        return "  %2("..self.mode_names[self.mode].."%)  "
    end,
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { bg = self.mode_colors[mode], fg = colors.bg_1, bold = true, }
    end,
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
}

local GitBranch = {
    condition = conditions.is_git_repo,-- and winbarComponentBlacklist(),

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { bg = colors.bg_1, fg = colors.accent_red  }, --theme.Gitbranch,


    {   -- git branch name
        provider = function(self)
            return "  " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "["
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = colors.accent_green },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = colors.accent_red },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = colors.accent_yellow },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "]",
    },
    { provider = " " }
}

local FileTypeName = {
  condition = function()
    return winbarComponentBlacklist(true)
  end,
  provider = function()
    local filetype = vim.bo.filetype
    return "%=" .. filetype
  end,
  hl = { bg = colors.bg_1 },
}

local FileName = {
  condition = function() 
    return winbarComponentBlacklist(false)
  end,
  provider = function()
    local fullFileName = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(fullFileName, ":.")
    if filename == "" then return "" end
    local icon = require("nvim-web-devicons").get_icon(filename)
    if icon == nil then icon = "" end
    return " " .. icon .. " " .. fullFileName
  end,
  hl = function()
    local fullFileName = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(fullFileName, ":.")
    if filename == "NvimTree" then return { } end
    local _, color = require'nvim-web-devicons'.get_icon_color(filename)
    return {
      fg = color,
      bold = true
    }
  end
}

local GitBlame = {
  provider = function()
    local git_blame = require('gitblame')
    local blame_text = git_blame.get_current_blame_text()
    return blame_text
  end,
  hl = theme.GitBlame,
  on_click = {
    callback = function()
      print("opening commit url...")
      vim.cmd("GitBlameOpenCommitURL")
    end,
    name = "heirline_gitblame",
  },
}

local CursorPos = {
  provider = function()
    return " %l/%L %2c "
  end,
  hl = theme.CursorPos,
}

local Space = { provider = " " }
local Fill = { 
  provider = "%=",
  hl = function()
    if winbarComponentBlacklist(false) then
      return { bg = colors.bg_1 }
    else
      return { bg = colors.bg_1 }
    end
  end,
}

local Statusline = {
  hl=theme.Statusline,
  {
    ViMode,
    FileName,
    Fill,
    GitBlame,
    Space,
    CursorPos,
  }
}

local BufferLineTab = {
  {
    condition = function()
      return winbarComponentBlacklist(false)
    end,
    provider = function(self)
      local fullFileName = vim.api.nvim_buf_get_name(self.bufnr)
      local filename = vim.fn.fnamemodify(fullFileName, ":t")
      if filename == "" then return " [No Name] " end
      return "  " .. filename ..  "  "
    end,
    hl = function(self)
      if self.is_active then
        return { fg = colors.bg_0, bg = colors.accent_blue, bold = true}
      else
        return { bg = colors.bg_2, fg = colors.accent_blue }
      end
    end,
    on_click = {
      callback = function(self)
        print(self.bufnr)
        vim.api.nvim_set_current_buf(self.bufnr)
      end,
      name = "heirline_set_bufnr",
    },
  },
}

local TablineBufferBlock = utils.surround({ "", "" }, function(self)
    if self.is_active then
      return colors.accent_blue
    else
      return colors.bg_2
    end
end, { BufferLineTab })

local BufferLine = utils.make_buflist(
  TablineBufferBlock,
  { provider = "", hl = { fg = "gray" } },
  { provider = "", hl = { fg = "gray" } }
)

local BufferLineWrapper = {
  condition = function()
    return winbarComponentBlacklist(false)
  end,
  {BufferLine},
}

local RightFancy = {
  condition = function()
    return winbarComponentBlacklist(false)
  end,
  provider = "",
  hl = { fg = colors.bg_1, bg = colors.bg_1 }
}

local BufferFileTypeIcon = {
  condition = function()
    return winbarComponentBlacklist(false)
  end,
  provider = function()
    local fullFileName = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(fullFileName, ":.")
    if filename == "" then return "" end
    local icon, _ = require'nvim-web-devicons'.get_icon_color(filename)
    if icon == nil then icon = "" end
    return " " .. icon .. " "
  end,
  hl = function()
    local fullFileName = vim.api.nvim_buf_get_name(0)
    local filename = vim.fn.fnamemodify(fullFileName, ":.")
    local _, color = require'nvim-web-devicons'.get_icon_color(filename)
    return { bg = colors.bg_1, fg = color, bold = true }
  end
}

local WinBar = {
  hl=theme.WinBar,
  {
    BufferFileTypeIcon,
    RightFancy,
    BufferLineWrapper,
    FileTypeName,
    Fill,
    GitBranch,
  }
}

require("heirline").setup({
  statusline = Statusline,
  winbar = WinBar,
})
