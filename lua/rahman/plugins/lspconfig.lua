local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
local borderNih = "rounded"
local opts = { buffer = bufnr, noremap = true, silent = true }

vim.diagnostic.config({
    float = { border = borderNih }
  })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = borderNih
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = borderNih
  }
)
  require('lspconfig.ui.windows').default_options.border = borderNih

  --mapping
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>gf', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- cmp
-- used to enable autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable the following language servers
local servers = {"tsserver","emmet_ls","volar"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["tsserver"].setup({
capabilities = capabilities,
on_attach = on_attach,
root_dir = vim.loop.cwd
})

-- lspconfig["html"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach
-- })
--
-- lspconfig["cssls"].setup({
-- capabilities = capabilities,
-- on_attach = on_attach
-- })

-- lspconfig["emmet_ls"].setup({
-- capabilities = capabilities,
-- on_attach = on_attach
-- })

lspconfig["volar"].setup({
  init_options = {
    typescript = {
      tsdk = ''
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    }
  }
})


-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
     ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
           elseif has_words_before() then
        cmp.complete()
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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  window = {
    completion = {
      border= 'rounded',
      scrollbar = ''
    },
    documentation = {
      border = 'rounded',
      scrollbar = ''
    }
  },
}
