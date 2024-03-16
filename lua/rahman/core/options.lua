vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true

vim.o.mouse = 'a'
vim.opt.showbreak = '↪'
vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.foldenable = false
vim.opt.foldlevel = 2
vim.opt.foldmethod = 'indent'
vim.opt.smoothscroll = true

vim.opt.list = true
vim.opt.listchars = {
    space = " ",
    eol = "",
    tab = "▎_",
    -- tab = "|_>",
    trail = " ",
    extends = "❯",
    precedes = "❮",
    nbsp = "",
}
vim.opt.fillchars = {
    fold = " ",
    foldsep = " ",
    foldopen = "",
    foldclose = "",
    diff = "╱",
}

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent =  true
vim.opt.breakindent = true
vim.opt.fileencodings = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.smarttab = true

vim.opt.wrap = false 

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search 
vim.opt.smartcase = true -- Case insensitive searching UNLESS /C or capital in search 

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vim.opt.undofile = true

vim.g.have_nerd_font = true

vim.opt.colorcolumn = "100"
vim.opt.cursorline = true

vim.opt.updatetime = 50

vim.opt.isfname:append("@-@")

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"


vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
