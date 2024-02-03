local get_os_command_output = require('util').get_os_command_output

local actions = require("telescope.actions")

require('telescope').setup({
  defaults = {
    border = {},
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
    color_devicons = true,
    prompt_prefix = "  ",
    selection_caret = "󰋇 ",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      }
    }
  },
  pickers = {
    find_files = { theme = "dropdown" },
  },
  extensions = {
    command_palette = {
      {
        "Git",
        { "View Diff",           "Gitsigns preview_hunk_inline" },
        { "Reset Buffer",        "Gitsigns reset_hunk" },
        { "Reset Hunk",          "Gitsigns reset_hunk" },
        { "Toggle Signs",        "Gitsigns toggle_signs" },
        { "Commit Url",          "GitBlameOpenCommitURL" },
        { "Line Url",            ":lua require('gitlinker').get_buf_range_url()" },
        { "Status",              "Telescope git_status" },
        { "Open file in github", ":lua require('core.telescope').git_file_link()" },
      },
      {
        "Octo",
        { "Checks", "Octo pr checks" },
        { "Pulls",  "Octo pr list assignee=trentslutzky" },
        { "Issues", "Octo issue list assignee=trentslutzky" },
      },
      {
        "Neovim",
        { "checkhealth",     ":checkhealth" },
        { "commands",        ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers",       ":lua require('telescope.builtin').registers()" },
        { "options",         ":lua require('telescope.builtin').vim_options()" },
        { "keymaps",         ":lua require('telescope.builtin').keymaps()" },
        { "buffers",         ":Telescope buffers" },
        { "search history",  ":lua require('telescope.builtin').search_history()" },
      },
      {
        "Configs",
        { "kitty",   "e ~/.config/kitty/kitty.conf" },
        { "nvim",    "e ~/.config/nvim" },
        { ".config", "e ~/.config" },
      },
      {
        "Format",
        { "format", "gggqG" },
      },
    },
  },
})

require("telescope").load_extension "command_palette"

local M = {}

M.project_files = function()
  local _, in_git, _ = get_os_command_output {
    "git",
    "rev-parse",
    "--is-inside-work-tree",
  }

  if in_git == 0 then
    require('telescope.builtin').git_files({
      results_title = "Git Files",
      prompt_title = "",
      theme = "dropdown",
    })
  else
    require('telescope.builtin').find_files({
      results_title = vim.fn.getcwd(),
      prompt_title = "",
      theme = "dropdown",
    })
  end
end

M.git_file_link = function()
  local file_link = vim.fn.fnamemodify(vim.fn.expand('%'), ':p:~:.')
  io.popen("gh browse " .. file_link)
end

return M
