local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }


-- local borderLsp = "rounded"
local borderLsp = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

vim.diagnostic.config({
    float = { border = borderLsp }
  })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = borderLsp
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = borderLsp
  }
)
  require('lspconfig.ui.windows').default_options.border = borderLsp

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
local servers = {"tsserver","volar"}
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

-- local volar_path=''
local tslib_path='/home/rahman/.local/share/pnpm/global/5/node_modules/typescript/lib/'

lspconfig["volar"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
    typescript = {
      tsdk = tslib_path
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    }
  }
})
-- local util = require 'lspconfig.util'
-- local function get_typescript_server_path(root_dir)
--
--   local global_ts = '/home/rahman/.local/share/pnpm/global/5/node_modules/typescript/lib/'
--   -- Alternative location if installed as root:
--   -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
--   local found_ts = ''
--   local function check_dir(path)
--     found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
--     if util.path.exists(found_ts) then
--       return path
--     end
--   end
--   if util.search_ancestors(root_dir, check_dir) then
--     return found_ts
--   else
--     return global_ts
--   end
-- end
--
-- require'lspconfig'.volar.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   on_new_config = function(new_config, new_root_dir)
--     new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
--   end,
-- }

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
    completion = cmp.config.window.bordered({ 
      border = "double" 
    }),
    documentation = cmp.config.window.bordered({ 
      border = "double" 
    }),
  },
}
