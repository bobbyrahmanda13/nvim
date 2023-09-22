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
| Mode | Key Shortcut | Description |
|-----|-----|-----|
| Normal | <kbd>K</kbd> | `Lsp Hover` |
| Normal | <kbd>J</kbd> | Delete blank line |
| Visual | <kbd>J</kbd> | Move down lines |
| Visual | <kbd>K</kbd> | Move up lines |
| Normal | <kbd>space</kbd>+<kbd>vrn</kbd> | Lsp rename |
| Normal | <kbd>space</kbd>+<kbd>s</kbd> | Replace all names with the same |
| Normal | <kbd>space</kbd>+<kbd>ex</kbd> | File Explorer |
| Normal | <kbd>space</kbd>+<kbd>nh</kbd> | No highlight | 
| Normal | <kbd>space</kbd>+<kbd>sv</kbd> | Split window vertically |
| Normal | <kbd>space</kbd>+<kbd>sh</kbd> | Split window horizontaly |
| Normal | <kbd>space</kbd>+<kbd>se</kbd> | Make split window equal |
| Normal | <kbd>space</kbd>+<kbd>sx</kbd> | Close current split window |
| Normal | <kbd>space</kbd>+<kbd>to</kbd> | Open new tab |
| Normal | <kbd>space</kbd>+<kbd>tx</kbd> | Close current tab |
| Normal | <kbd>space</kbd>+<kbd>tn</kbd> | Go to next tab |
| Normal | <kbd>space</kbd>+<kbd>tp</kbd> | Go to previous tab |
| Normal | <kbd>space</kbd>+<kbd>h</kbd> | Jump to left window |
| Normal | <kbd>space</kbd>+<kbd>l</kbd> | Jump to right window |
| Normal | <kbd>space</kbd>+<kbd>k</kbd> | Jump to up window |
| Normal | <kbd>space</kbd>+<kbd>j</kbd> | Jump to down window |
| Normal | <kbd>space</kbd>+<kbd>p</kbd> | Highlight and copy the sentence/word/paragraph then you highlight the sentence/word/paragraph and paste it there |


