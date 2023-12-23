return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opt = true },
    },
    lazy = false,
    config = function()
        require('lualine').setup({
            options = {
                theme = 'powerline',
                globalstatus = true,
            },
            tabline = {
                lualine_a = {
                    {
                        'buffers',
                        mode = 2,
                    }
                },
                lualine_b = {'branch'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'tabs'}
            },
            sections = {
                lualine_a = {
                    'mode',
                    'searchcount',
                },
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'filename',
                        path = 2, -- Display absolute path with ~ for home
                    }
                },
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location', '%b %B', '%h%m%r'} -- location, ASCII & Hex, [Help][Read Only] flags
            },
            extensions = {
                "neo-tree",
            },
        })
    end
}
