local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "zx", function() harpoon:list():select(1) end)
vim.keymap.set("n", "zc", function() harpoon:list():select(2) end)
vim.keymap.set("n", "zn", function() harpoon:list():select(3) end)
vim.keymap.set("n", "zm", function() harpoon:list():select(4) end)
