-- load friendly-snippets
local luasnip = require("luasnip")
local luasnipLoader = require("luasnip.loaders.from_vscode")

luasnipLoader.lazy_load()
luasnip.filetype_extend("javascript", {"vue"})
luasnip.filetype_extend("typescript", {"javascript"})
luasnip.filetype_extend("vue", {"javascript","typescript"})
