local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
highlight = {
  enable = true
},
indent = { enable = true },
autotag = { enable = true },
ensure_installed = {
"json", "regex", "javascript", "typescript", "tsx", "yaml", "html", "css", "markdown", "svelte",
"graphql", "bash", "lua", "vim", "dockerfile", "vue", "sql", "scss", "python", "php", "astro",
},
auto_install = true,
})
