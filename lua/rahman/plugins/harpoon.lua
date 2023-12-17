local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "hx", function() harpoon:list():select(1) end)
vim.keymap.set("n", "hc", function() harpoon:list():select(2) end)
vim.keymap.set("n", "hn", function() harpoon:list():select(3) end)
vim.keymap.set("n", "hm", function() harpoon:list():select(4) end)
