local config = require("atlas.config")

local M = {}

local move_tbl = { left = "H", right = "L", bottom = "J", top = "K" }

M.is_prompt_exiting = false

M.View = {
    bufnr = nil,
    tabpages = {},
    width = 10,
    side = "left",
    winopts = {
        relativenumber = false,
        number = false,
        list = false,
        winfixwidth = true,
        winfixheight = true,
        foldenable = false,
        spell = false,
        signcolumn = "no",
        foldmethod = "manual",
        foldcolumn = "0",
        cursorcolumn = false,
        colorcolumn = "0",
    },
    bufopts = {
        { name = "swapfile", val = false },
        { name = "buftype", val = "nofile" },
        { name = "modifiable", val = false },
        { name = "filetype", val = "Atlas" },
        { name = "bufhidden", val = "hide" },
    },
}


local function find_rogue_buffer()
    for _, v in ipairs(vim.api.nvim_list_bufs()) do
        if string.match(vim.fn.bufname(v), "^Atlas_.*") then
            return v
        end
    end
    return nil
end


local function is_buf_valid()
    if M.View.bufnr == nil then
        return false
    end
    return vim.api.nvim_buf_is_valid(M.View.bufnr) and vim.api.nvim_buf_is_loaded(M.View.bufnr)
end


function M._wipe_rogue_buffer()
    local bn = find_rogue_buffer()
    if bn then
        local win_ids = vim.fn.win_findbuf(bn)
        for _, id in ipairs(win_ids) do
            if vim.fn.win_gettype(id) ~= "autocmd" then
                vim.api.nvim_win_close(id, true)
            end
        end

        vim.api.nvim_buf_set_name(bn, "")
        vim.schedule(function()
            pcall(vim.api.nvim_buf_delete, bn, {})
        end)
    end
end


local function generate_buffer_name()
    return "Atlas_" .. math.random(1000000)
end


function M.get_winnr()
    local tabpage = vim.api.nvim_get_current_tabpage()
    local tabinfo = M.View.tabpages[tabpage]
    if tabinfo ~= nil then
        return tabinfo.winnr
    end
end


function M.is_win_open(opts)
    if opts and opts.any_tabpage then
        for _, v in pairs(M.View.tabpages) do
            if vim.api.nvim_win_is_valid(v.winnr) then
                return true
            end
        end
        return false
    else
        return M.get_winnr() ~= nil and vim.api.nvim_win_is_valid(M.get_winnr())
    end
end


function M.setup()
    M.View.side = config.side or M.View.side
    M.View.width = config.initial_width or M.View.width

    M.View.bufnr = vim.api.nvim_create_buf(false, false)
    -- bindings.inject(M.View.bufnr)

    local buffer_name = generate_buffer_name()

    if not pcall(vim.api.nvim_buf_set_name, M.View.bufnr, buffer_name) then
        M._wipe_rogue_buffer()
        vim.api.nvim_buf_set_name(M.View.bufnr, buffer_name)
    end

    for _, opt in ipairs(M.View.bufopts) do
        vim.bo[M.View.bufnr][opt.name] = opt.val
    end
end


local function set_local(opt, value)
    vim.api.nvim_win_set_option(0, opt, value)
end


function M.open(options)
    if M.is_win_open() then
      return
    end
    options = options or { focus = false }
    if not is_buf_valid() then
        M.setup()
    end

    vim.api.nvim_command("vsp")

    local move_to = move_tbl[M.View.side]
    vim.api.nvim_command("wincmd " .. move_to)
    vim.api.nvim_command("vertical resize " .. M.View.width)
    local winnr = vim.api.nvim_get_current_win()
    local tabpage = vim.api.nvim_get_current_tabpage()
    M.View.tabpages[tabpage] = vim.tbl_extend("force", M.View.tabpages[tabpage] or {}, { winnr = winnr })
    vim.cmd("buffer " .. M.View.bufnr)
    for k, v in pairs(M.View.winopts) do
        set_local(k, v)
    end
    vim.cmd(":wincmd =")
    if not options.focus then
        vim.cmd("wincmd p")
    end
    require("atlas.render").setup(options)
end


function M.close()
    if not M.is_win_open() then
        return
    end
    vim.api.nvim_win_hide(M.get_winnr())
end


function M.toggle()
    if not M.is_win_open() then
      M.open()
    else
      M.close()
    end
end

return M
