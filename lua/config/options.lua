local opt = vim.opt

-- Apperance
opt.number = true
opt.relativenumber = true
opt.list = true
opt.listchars = { tab = '→ ', trail = '·', extends = '»', precedes = '«', eol = '¬' }
opt.background = "dark"
opt.termguicolors = true
opt.cursorline = true         -- update the entire line where the cursor is
opt.wrap = false
opt.signcolumn = "yes"
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.hlsearch = false;
opt.smartcase = true
opt.inccommand = "split" -- results of search/substitution show in a split window below

-- Tab/Indentation
opt.expandtab = true          -- Use spaces instead of tabs
opt.tabstop = 4               -- Tab key is display with 4 spaces in normal mode
opt.softtabstop = 4           -- Tab key indents by 4 spaces in insert mode
opt.shiftwidth = 4            -- >> indents by 4 spaces
opt.shiftround = true         -- >> indents to next multiple of 'shiftwidth'
opt.smartindent = true

-- Behavior
opt.scrolloff = 999             -- keep few lines above and below the cursor during scrolling. 999 ensure scrolling happens from the middle of the screen
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.undofile = true
opt.clipboard = "unnamed,unnamedplus"
opt.virtualedit = "block" -- <C-v> works on block even if there are no characters to select
opt.updatetime = 250
opt.timeoutlen = 300          -- time in milliseconds to wait for a mapped sequence to complete
opt.mouse = "a"
opt.mousemoveevent = true
opt.wildmode = 'longest:full,full'
opt.completeopt = { "menuone", "noselect" }

-- vim.lsp.set_log_level(vim.log.levels.INFO)
