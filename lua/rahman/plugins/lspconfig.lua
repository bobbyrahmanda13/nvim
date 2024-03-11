local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'
local bind = vim.keymap.set

local borderLsp = "rounded"
-- local borderLsp = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

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

-- create underline
-- local hl_groups = { 'DiagnosticUnderlineError','DiagnosticUnderlineWarn','DiagnosticUnderlineInfo','DiagnosticUnderlineHint' }
-- for _, hl in ipairs(hl_groups) do
--   vim.cmd.highlight(hl .. ' gui=undercurl')
-- end

vim.cmd([[highlight ErrorMsg guibg=#3d0000 ]])
vim.cmd([[highlight WarningMsg guibg=#513A1A ]])
vim.cmd([[highlight DiagnosticHintLn guibg=#024649 ]])
vim.cmd([[highlight DiagnosticInfoLn guibg=#024649 ]])

local signsIcon = { ERROR = " ", WARN = " ", HINT = "󰠠 ", INFO = " " }

vim.diagnostic.config({
  float = { border = borderLsp },
  -- virtual_text = true, --default true
  -- underline = true,
  -- severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signsIcon.ERROR,
      [vim.diagnostic.severity.WARN] = signsIcon.WARN,
      [vim.diagnostic.severity.INFO] = signsIcon.INFO,
      [vim.diagnostic.severity.HINT] = signsIcon.HINT,
    },
    --   linehl = {
    --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    --     [vim.diagnostic.severity.WARN] = 'WarningMsg',
    --     [vim.diagnostic.severity.INFO] = 'DiagnosticInfoLn',
    --     [vim.diagnostic.severity.HINT] = 'DiagnosticHintLn',
    --   },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
    },
  }
})

-- deprecated
-- local on_attach = function(_, bufnr)
--   local opts = { buffer = bufnr, noremap = true, silent = true }
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    bind('n', 'gdc', vim.lsp.buf.declaration, opts)
    bind('n', 'gdf', vim.lsp.buf.definition, opts)
    bind('n', 'K', vim.lsp.buf.hover, opts)
    bind('n', '<leader>vd', vim.diagnostic.open_float, opts)
    bind('n', '[d', vim.diagnostic.goto_next, opts)
    bind('n', ']d', vim.diagnostic.goto_prev, opts)
    bind('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    bind('n', '<leader>vrr', vim.lsp.buf.references, opts)
    -- bind('n', '<leader>vrr', "<cmd>Telescope lsp_references<CR>", opts)
    bind('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    bind('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    bind('n', '<leader>hf', function()
      vim.lsp.buf.format {}
    end, opts)
  end,
})

-- cmp
-- used to enable autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable the following language servers
local servers = {"tsserver","volar"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["tsserver"].setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  root_dir = vim.loop.cwd,
  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/rahman/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin",
        languages = {"javascript","typescript","vue"}
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue"
  },
})

-- local volar_path=''
local tslib_path='/home/rahman/.local/share/pnpm/global/5/node_modules/typescript/lib/'

lspconfig["volar"].setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  root_dir = util.root_pattern 'package.json',
  init_options = {
    typescript = {
      tsdk = tslib_path
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    },
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
    completion = cmp.config.window.bordered({ 
      border = borderLsp 
    }),
    documentation = cmp.config.window.bordered({ 
      border = borderLsp 
    }),
  },
}
