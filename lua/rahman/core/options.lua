local opt = vim.opt -- for conciseness

-- line numbers
-- opt.list = true
-- opt.listchars:append({ tab = '▸\\ ', trail = '·', extends = '❯', precedes = '❮', nbsp = '␣' })
-- opt.listchars:append({ 
--   -- eol = '¬', 
--   space = '_' 
-- })

opt.showbreak = '↪'
opt.breakindent = true
opt.breakindentopt = { shift = 2 }

-- opt.relativenumber = true
opt.number = true
vim.g.netrw_keepdir = 0

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- opt.showtabline = 0

-- line wrapping
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appereance 
opt.termguicolors = true
--opt.background = "dark"
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

