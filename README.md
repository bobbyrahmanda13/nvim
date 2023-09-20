# Rahman init.lua
Ini adalah config untuk developer javascript / typescript, config ini tanpa menggunakan null-ls sebagai formatting atau menggunakan mason karena malas kwkwk jadi kalau mau install language server ikutin cara LSP aja install pake package manager yg kalian sukai

## Quickstart
Karena saya menggunakan build from source jadi ini package debian yang harus saya install
- ini jika menggunakan linux debian 
```
sudo apt-get install ninja-build gettext cmake unzip curl xsel systemtap-sdt-dev build-essential ripgrep fd-find
```
untuk informasi selanjutnya liat aja di [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)

- ini jika menggunakan termux
```pkg install neovim nodejs-lts curl xsel build-essential ripgrep fd-findunzip ```
karena di termux package nya tidak selengkap linux jadi install aja apa yang ada aja kwkwk pake **pnpm** aja error gk jalan, pake **yarn** malas, ujung2 pake **npm** aja lagi, karena build from source juga gk bisa di termux

## Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [luasnip](https://github.com/L3M0N4D3/LuaSnip)
- [nvim-lualine](https://github.com/nvim-lualine/lualine.nvim)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- Colorscheme [catppuccin](https://github.com/catppuccin/nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Keyboard Shortcuts
| Key Shortcut | Description |
|-----|-----|
| <kbd>K</kbd> | `Lsp Hover` |
| <kbd>space</kbd>+<kbd>vrn</kbd> | Lsp Rename |
| <kbd>space</kbd>+<kbd>s</kbd> | Replace all names with the same |
| <kbd>space</kbd>+<kbd>ex</kbd> | File Explorer |
| <kbd>space</kbd>+<kbd>nh</kbd> | No Higlight | 
| <kbd>space</kbd>+<kbd>sv</kbd> | Split Window Vertically |
| <kbd>space</kbd>+<kbd>sh</kbd> | Split Window Horizontaly |
| <kbd>space</kbd>+<kbd>se</kbd> | Make Split Window Equal |
| <kbd>space</kbd>+<kbd>sx</kbd> | Close Current Split Window |


