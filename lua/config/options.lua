local options = {
    number = true,
    relativenumber = true,
    list = true,
    listchars = { tab = "→ ", trail = "·", extends = "»", precedes = "«", eol = "¬" },
    background = "dark",
    termguicolors = true,
    cursorline = true,
    wrap = false,
    signcolumn = "yes",
    breakindent = true,

    ignorecase = true,
    hlsearch = false,
    smartcase = true,
    inccommand = "split",

    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    shiftround = true,
    smartindent = true,

    scrolloff = 15,
    sidescrolloff = 5,
    splitright = true,
    splitbelow = true,
    swapfile = false,
    undofile = true,
    clipboard = "unnamed,unnamedplus",
    virtualedit = "block",
    updatetime = 250,
    timeoutlen = 300,
    mouse = "a",
    mousemoveevent = true,
    wildmode = "longest:full,full",
    completeopt = "menu,menuone,noselect",
}

vim.opt.shortmess:append("IsF")

for option, value in pairs(options) do
    vim.opt[option] = value
end

