function ColorNvim(background, color)
    color = color or "rose-pine"
    background = background or false
    print(color)
	vim.cmd.colorscheme(color)

    if background == false then
	    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    elseif background == true then
	    vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
	    vim.api.nvim_set_hl(1, "NormalFloat", { bg = "none" })
    end;

end


ColorNvim()
