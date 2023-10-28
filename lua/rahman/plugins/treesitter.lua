require'nvim-treesitter.configs'.setup {

	ensure_installed = { "javascript","typescript","html","css","python","bash","markdown","markdown_inline","lua","sql","regex","json","scss","vue" },

	sync_install = false,
	auto_install = true,
	indent = { enable = true },
	autotag = { enable = true },
	highlight = {
		enable = true,

		additional_vim_regex_highlighting = false,
	},
}
