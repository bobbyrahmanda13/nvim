local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
local severity = vim.diagnostic.severity

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- general keymaps
bind("i", "jk", "<Esc>")              -- out insert mode to normal mode
bind("n", "<leader>bt", ":term<CR>")  -- open terminal
bind("n", "<leader>lz", ":Lazy<CR>")  -- open lazy
bind("n", "<leader>ms", ":Mason<CR>") -- open mason

bind("n", "<C-s>", ":w<CR>")          -- save

bind("n", "<leader>sv", "<C-w>v")     -- split window vertically
bind("n", "<leader>sh", "<C-w>s")     -- split window horizontaly
bind("n", "<leader>se", "<C-w>=")     -- make split windows equal width
bind("n", "<leader>sx", ":close<CR>") -- close current split window

bind("n", "rv", ":vertical resize +5")
bind("n", "rvv", ":vertical resize -5")
bind("n", "rh", ":horizontal resize +5")
bind("n", "rhh", ":horizontal resize -5")

bind("n", "<leader>to", ":tabnew<CR>")   -- open new tab
bind("n", "<leader>tx", ":tabclose<CR>") -- close current tab
bind("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
bind("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab
bind("n", "<leader>tf", ":tabnew %<CR>") -- go to previous tab

bind("n", "<leader>h", "<C-w>h")         -- move cursor window to left
bind("n", "<leader>j", "<C-w>j")         -- move cursor window to down
bind("n", "<leader>k", "<C-w>k")         -- move cursor window to up
bind("n", "<leader>l", "<C-w>l")         -- move cursor window to right

bind("v", "J", ":m '>+1<CR>gv=gv")       -- moves lines down in visual selection
bind("v", "K", ":m '<-2<CR>gv=gv")       -- moves lines up in visual selection

bind("n", "J", "mzJ`z")                  -- menggabungkan garis bawah ke garis atas dan meletakkannya di belakang
bind("n", "Q", "<nop>")

bind("n", "<C-d>", "<C-d>zz") -- move down in buffer with cursor centered
bind("n", "<C-u>", "<C-u>zz") -- move up in buffer with cursor centered

bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")

bind("v", "<", "<gv", opts)
bind("v", ">", ">gv", opts)

bind("x", "<leader>p", [["_dP]]) -- paste without replacing clipboard content
bind("v", "p", '"_dp', opts)
bind({ "n", "v" }, "<leader>d", [["_d]])

bind({ "n", "v" }, "<leader>y", "\"+yap") -- yank to paragraph
bind("n", "<leader>Y", [["+Y]])

bind("n", "y1", "yiw")   -- yank word
bind("n", "t2", "viwxi") -- remove word

bind("n", "<leader>f", vim.lsp.buf.format)

bind("n", "x", '"_x', opts)                                                    -- prevents deleted characters from copying to clipboard

bind("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --Replace word cursor is on globally
bind("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/]])
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

bind("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("rahman-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Aktifkan petunjuk tipe data (inlay hints) saat LSP menempel ke buffer
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filePath)
  print("File path copied to clipboard:" .. filePath)
end, { desc = "Copy file path to clipboard" }
)

bind("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- terminal nvim vim.keymap
bind("t", "<A-n>", [[<C-\><C-n>]])
bind("t", "<A-h>", [[<C-\><C-n><C-w>h]])
bind("t", "<A-j>", [[<C-\><C-n><C-w>j]])
bind("t", "<A-k>", [[<C-\><C-n><C-w>k]])
bind("t", "<A-l>", [[<C-\><C-n><C-w>l]])

-- vim.keymap autoclose
bind("i", "(", "()<left>")
bind("i", "[", "[]<left>")
bind("i", "{", "{}<left>")
bind("i", "<", "<><left>")
bind("i", "'", "''<left>")
bind("i", '"', '""<left>')

-- Keymap render-markdown
bind("n", "<leader>md", ":RenderMarkdown toggle<CR>") -- render markdown

-- terminal nvim vim.keymap
bind("t", "<A-n>", [[<C-\><C-n>]])
bind("t", "<A-h>", [[<C-\><C-n><C-w>h]])
bind("t", "<A-j>", [[<C-\><C-n><C-w>j]])
bind("t", "<A-k>", [[<C-\><C-n><C-w>k]])
bind("t", "<A-l>", [[<C-\><C-n><C-w>l]])

bind("n", "<leader>gf", [[ggVG=]])


-- disable key
bind("n", "q", "<Nop>")
bind("n", "<Left>", "<Nop>")
bind("n", "<Right>", "<Nop>")
bind("n", "<Up>", "<Nop>")
bind("n", "<Down>", "<Nop>")
bind("n", "<C-z>", "<Nop>")

local vopt = vim.opt

-- options config nvim

vopt.clipboard = 'unnamedplus'

vopt.inccommand = "split"
vopt.number = true
vopt.relativenumber = true

vim.o.mouse = 'a'
vopt.showbreak = '↪'
vopt.backspace = { "start", "eol", "indent" }

vopt.foldenable = false
vopt.foldlevel = 2
vopt.foldmethod = 'indent'

vopt.list = true
vopt.listchars = {
  space = " ",
  eol = "",
  tab = "▎ ",
  -- tab = "|_>",
  trail = ".",
  extends = "❯",
  precedes = "❮",
  nbsp = "",
}
vopt.fillchars = {
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  eob = " ",
}

vopt.tabstop = 2
vopt.shiftwidth = 2
vopt.softtabstop = 2
vopt.expandtab = true

vopt.title = true
vopt.autoindent = true
vopt.smartindent = true
vopt.breakindent = true
vopt.fileencodings = "utf-8"
vim.scriptencoding = "utf-8"
vopt.encoding = "utf-8"
vopt.smarttab = true

vopt.wrap = true

vopt.hlsearch = false
vopt.incsearch = true

vopt.termguicolors = true

vopt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vopt.smartcase = true  -- Case insensitive searching UNLESS /C or capital in search

vopt.splitbelow = true -- Put new windows below current
vopt.splitright = true -- Put new windows right of current

vopt.backup = false
vopt.swapfile = false
vopt.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vopt.undofile = true

vim.g.have_nerd_font = true

vopt.colorcolumn = "100"
vopt.cursorline = true

vopt.updatetime = 50

vopt.isfname:append("@-@")

vopt.scrolloff = 8
vopt.signcolumn = "yes"

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
