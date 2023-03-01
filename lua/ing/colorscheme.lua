
function ColorScheme(color)
    color = color or "solarized8"

    if color == "everforest" then
        vim.cmd[[
            let g:everforest_background = 'hard'
            let g:everforest_better_performance = 1
            ]]
    end

    vim.cmd.colorscheme(color)
end

local colors = {
    "tokyonight",
    "everforest",
    'gruvbox',
    "solarized"
}

ColorScheme(colors[4])

