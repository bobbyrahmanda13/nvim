-- load my-snippet
local luasnip = require("luasnip")
local luasnipLoader = require("luasnip.loaders.from_vscode")

luasnipLoader.lazy_load()
