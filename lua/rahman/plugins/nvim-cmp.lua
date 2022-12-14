local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
  return
end

-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("javascript", {"vue"})
luasnip.filetype_extend("typescript", {"javascript"})
luasnip.filetype_extend("vue", {"javascript","typescript"})

vim.opt.completeopt = "menu,menuone,noselect"

 cmp.setup({
   snippet = {
     expand = function(args)
       luasnip.lsp_expand(args.body)
     end,
   },
   mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
 }),
 sources = cmp.config.sources({
   { name = "nvim_lsp" }, -- lsp 
   { name = "luasnip" }, -- snippets
   { name = "buffer" }, -- text within current buffer
   { name = "path" }, -- file system paths
 }),
 formatting = {
   format = lspkind.cmp_format({
     maxwidth = 50,
     ellipsis_char = "...",
   }),
 },
 })
