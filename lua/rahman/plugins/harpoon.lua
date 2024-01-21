local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "x1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "x2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "x3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "x4", function() harpoon:list():select(4) end)
