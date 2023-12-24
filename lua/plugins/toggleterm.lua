return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-\>]],
            hide_numbers = false,
            -- shading_factor = 2,
            direction = "float",
            float_opts = {
                border = "curved",
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
    end,
}

