local function map(mode, lhs, rhs, opts)
    -- set default value if nothing has been specified
    if opts.noremap == nil then
        opts.noremap = true
    end

    if opts.silent == nil then
        opts.silent = true
    end

    vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "i", "v" }, "jk", "<Esc>", {})
map({ "i", "v" }, "kj", "<Esc>", {})

-- Movement between panes
map("", "<C-h>", "<C-w>h", {})
map("", "<C-j>", "<C-w>j", {})
map("", "<C-k>", "<C-w>k", {})
map("", "<C-l>", "<C-w>l", {})

-- Movement between buffers
map("n", "<A-j>", ":bnext<CR>", {})
map("n", "<A-k>", ":bprevious<CR>", {})
map("n", "<A-d>", ":bdelete<CR>", {})

map("n", "<leader>sv", "<C-w>v", {}) -- split window vertically
map("n", "<leader>sh", "<C-w>s", {}) -- split window horizontally
map("n", "<leader>se", "<C-w>=", {}) -- make split windows equal in height & width
map("n", "<leader>sx", ":close<CR>", {}) -- close the pane

map("n", "<C-a>", "ggVG", {})

map("n", "<leader>nh", ":nohl<CR>", {})

map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

map("n", "<leader>w", "<cmd>w<cr>", {})
map("n", "<leader>q", "<cmd>q<cr>", {})
map("n", "<leader>x", "<cmd>x<cr>", {})

map("n", "j", [[v:count? "j" : "gj"]], {noremap = true, expr = true})
map("n", "k", [[v:count? "k" : "gk"]], {noremap = true, expr = true})

