local mapkey = vim.keymap

local M = {}

M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    mapkey.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", opts) -- go to definition
    mapkey.set("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- peak definition
    mapkey.set("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- go to definition
    mapkey.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
    mapkey.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
    mapkey.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    mapkey.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    mapkey.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to prev diagnostic in buf
    mapkey.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buf
    mapkey.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

    if client.name == "pyright" then
        mapkey.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
    end
end

return M

