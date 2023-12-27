---@param theme string
function SetTheme(theme)
    if theme == nil or theme == 'default 'then
        theme = 'rose-pine'
    end
    local fnCall = string.format('colorscheme %s', theme)
    status, _ = pcall(vim.cmd, fnCall)

    if not status then
        print(string.format("Theme %s cannot be found", theme))
    end

    print(string.format("Theme has been set to: %s", theme))
end

function SetBackground(transparency, background)
    local defaultTransparency = 1
    if transparency == nil then
        transparency = defaultTransparency
    end
    vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
end

SetTheme('tokyonight-moon')
