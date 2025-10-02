function ColorWindow(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
end

ColorWindow()
