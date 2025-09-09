return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},

    config = function()
        require("tokyonight"):setup({
            style = "night",
            transparent = false, -- Enable this to disable setting the background color
            styles = {
                functions = {}
            },
            -- Change the "hint" color to the "orange" color, and make the "error" color bright red
            on_colors = function(colors)
                colors.hint = colors.orange
                colors.error = "#ff0000"
            end
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
