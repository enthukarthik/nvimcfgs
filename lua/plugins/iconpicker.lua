return {
    "ziontee113/icon-picker.nvim",
    event = "InsertEnter",
    dependencies = {
        "stevearc/dressing.nvim"
    },
    config = function()
        require("icon-picker").setup({
            disable_legacy_commands = true
        })
        local opts = { noremap = true, silent = true }

        -- vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
        -- vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) -- Yank the selected icon into register
        vim.keymap.set("i", "<leader><leader>i", "<cmd>IconPickerInsert<cr>", opts)
    end
}
