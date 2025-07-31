local opts = { noremap = true, silent = true }
local bind = vim.keymap.set

vim.g.mapleader = " "

-- general keymaps
bind("i", "jk", "<Esc>")                                                          -- out insert mode to normal mode

bind("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search hl", silent = true }) -- clears search highlights
bind("n", "<C-s>", ":w<CR>")                                                      -- save

bind("n", "<leader>sv", "<C-w>v")                                                 -- split window vertically
bind("n", "<leader>sh", "<C-w>s")                                                 -- split window horizontaly
bind("n", "<leader>se", "<C-w>=")                                                 -- make split windows equal width
bind("n", "<leader>sx", ":close<CR>")                                             -- close current split window

bind("n", "rv", ":vertical resize +5")
bind("n", "rvv", ":vertical resize -5")
bind("n", "rh", ":horizontal resize +5")
bind("n", "rhh", ":horizontal resize -5")

bind("n", "<leader>to", ":tabnew<CR>")    -- open new tab
bind("n", "<leader>tx", ":tabclose<CR>")  -- close current tab
bind("n", "<leader>tn", ":tabn<CR>")      -- go to next tab
bind("n", "<leader>tp", ":tabp<CR>")      -- go to previous tab
bind("n", "<leader>tf", ":tabnew %<CR>>") -- go to previous tab

bind("n", "<leader>h", "<C-w>h")          -- move cursor window to left
bind("n", "<leader>j", "<C-w>j")          -- move cursor window to down
bind("n", "<leader>k", "<C-w>k")          -- move cursor window to up
bind("n", "<leader>l", "<C-w>l")          -- move cursor window to right

bind("v", "J", ":m '>+1<CR>gv=gv")        -- moves lines down in visual selection
bind("v", "K", ":m '<-2<CR>gv=gv")        -- moves lines up in visual selection

bind("n", "J", "mzJ`z")                   -- menggabungkan garis bawah ke garis atas dan meletakkannya di belakang
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
bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- Highlight Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("rahman-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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

bind("n", "<leader>gf", [[ggVG=]])

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
