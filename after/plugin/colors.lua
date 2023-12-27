---@param theme string
function SetTheme(theme)
    if theme == nil or theme == 'default 'then
        theme = 'rose-pine'
    end

    vim.cmd.colorscheme = theme
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
