-- Load Mason Registry API
local mason_registry = require("mason-registry")

-- Helper function to get installed formatters for a specific filetype
local function get_formatters_for_filetype(filetype)
  local formatters = {}

  for _, package in ipairs(mason_registry.get_installed_packages()) do
    -- Fetch package metadata
    local metadata = package.spec

    -- Check if the package has the "Formatter" category and supports the filetype
    if metadata.categories and vim.tbl_contains(metadata.categories, "Formatter") then
      if metadata.languages then
        for _, lang in ipairs(metadata.languages) do
          if lang:lower() == filetype:lower() then
            table.insert(formatters, package.name)
            break
          end
        end
      end
    end
  end

  return formatters
end

local function run_formatters()
  local filetype = vim.bo.filetype -- Get the current filetype
  local formatters = get_formatters_for_filetype(filetype)

  -- Only run formatters if the file has been modified
  if not vim.bo.modified and #formatters > 0 then
    for _, formatter in ipairs(formatters) do
      print("Running", formatter)
      vim.cmd(string.format("silent! !%s %%", formatter))
    end
  end
end

-- Autocmd to run the formatter before quitting the file, only if it was modified
-- vim.api.nvim_create_autocmd("ExitPre", {
--   pattern = "*", -- Run for all files
--   callback = function()
--     run_formatters()
--   end,
-- })

return {
  run_formatters = run_formatters,
}
