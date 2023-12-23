return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
                -- build = 'make'
            },
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
            vim.keymap.set('n', '<leader>te', ":Telescope<CR>", {})

            local telescope = require("telescope")
            telescope.load_extension("fzf")

            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-h>"] = actions.which_key,
                        }
                    }
                }
            })
        end
    }
}
