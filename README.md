# Rahman init.lua
This is a config for javascript / typescript developers, this config without using null-ls as formatting or using mason because you're lazy, so if you want to install a language server, just follow the LSP method and install it using the package manager you like

## Quickstart

Because I use build from source, this is the Debian package that I have to install

- this is if using Debian Linux

```
sudo apt-get install ninja-build gettext cmake unzip curl xsel systemtap-sdt-dev build-essential ripgrep fd-find
```
For further information, just look at [Building Neovim](https://github.com/neovim/neovim/wiki/Building-Neovim)

- this is if using termux

```pkg install neovim nodejs-lts curl xsel build-essential ripgrep fd-find unzip ```

Because in termux the package is not as complete as linux so just install whatever is there, just use **pnpm** error, use **yarn** is lazy, in the end just use **npm** again, because building from source also doesn't work in termux

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

### Editor
| Mode | Key Shortcut | Description |
|-----|-----|-----|
| Visual | <kbd>J</kbd> | Move the highlighted code to the bottom using visual mode |
| Visual | <kbd>K</kbd> | Move the highlighted code to the top using visual mode |
| Normal | <kbd>Space</kbd>+<kbd>s</kbd> | Replace all names with the same |
| Normal | <kbd>Space</kbd>+<kbd>ex</kbd> | File Explorer |
| Normal | <kbd>Space</kbd>+<kbd>nh</kbd> | No highlight | 
| Normal | <kbd>Space</kbd>+<kbd>sv</kbd> | Split window vertically |
| Normal | <kbd>Space</kbd>+<kbd>sh</kbd> | Split window horizontaly |
| Normal | <kbd>Space</kbd>+<kbd>se</kbd> | Make split window equal |
| Normal | <kbd>Space</kbd>+<kbd>sx</kbd> | Close current split window |
| Normal | <kbd>Space</kbd>+<kbd>tx</kbd> | Close current tab |
| Normal | <kbd>Space</kbd>+<kbd>to</kbd> | Open new tab |
| Normal | <kbd>Space</kbd>+<kbd>tn</kbd> | Go to next tab |
| Normal | <kbd>Space</kbd>+<kbd>tp</kbd> | Go to previous tab |
| Normal | <kbd>Space</kbd>+<kbd>h</kbd> | Jump to left window |
| Normal | <kbd>Space</kbd>+<kbd>l</kbd> | Jump to right window |
| Normal | <kbd>Space</kbd>+<kbd>k</kbd> | Jump to up window |
| Normal | <kbd>Space</kbd>+<kbd>j</kbd> | Jump to down window |
| Normal | <kbd>Ctrl</kbd>+<kbd>d</kbd> | Jumps down half a page but the cursor stays in the middle |  
| Normal | <kbd>Ctrl</kbd>+<kbd>u</kbd> | Jumps up half a page but the cursor stays in the middle |  
| Normal | <kbd>n</kbd> | Used if you are looking for something and then highlight what you are looking for, use this and the cursor will always be in the middle (down) | 
| Normal | <kbd>N</kbd> | Used if looking for something if you have found it, use this then the cursor will always be in the middle (up) |
| Normal | <kbd>Space</kbd>+<kbd>Space</kbd> | Reload configuration | 
| Normal | <kbd>y1</kbd> | Copy words  |
| Normal | <kbd>t2</kbd> | Highlight words |  
| Normal | <kbd>Space</kbd>+<kbd>p</kbd> | Highlight and copy the sentence/word/paragraph then you highlight the sentence/word/paragraph and paste it there |
| Normal | <kbd>Space</kbd>+<kbd>vd</kbd> | Open diagnostic  |
| Normal | <kbd>[d</kbd> | Diagnostic go to next |
| Normal | <kbd>]d</kbd> | Diagnostic go to prev |

### Plugins
| Mode | Key Shortcut | Description |
|-----|-----|-----|
| Normal | <kbd>K</kbd> | `Lsp Hover` |
| Normal | <kbd>Space</kbd>+<kbd>vrn</kbd> | Lsp rename |
| Normal | <kbd>Space</kbd>+<kbd>vrr</kbd> | Lsp buf references |
| Normal | <kbd>Space</kbd>+<kbd>vca</kbd> | Lsp buf code action |
| Normal | <kbd>Space</kbd>+<kbd>gf</kbd> | Lsp buf format |
| Normal | <kbd>Ctrl</kbd>+<kbd>h</kbd> | Lsp buf signature help |
| Normal | <kbd>gd</kbd> | Lsp buf definition |
| Normal | <kbd>Space</kbd>+<kbd>ff</kbd> | Telescope find files |
| Normal | <kbd>Space</kbd>+<kbd>fg</kbd> | Telescope live grep |
| Normal | <kbd>Space</kbd>+<kbd>fc</kbd> | Telescope grep string using nvim input |
| Normal | <kbd>Space</kbd>+<kbd>fb</kbd> | Telescope buffers |
| Normal | <kbd>Space</kbd>+<kbd>fh</kbd> | Telescope help tags |
| Normal | <kbd>Space</kbd>+<kbd>gc</kbd> | Telescope git commits |
| Normal | <kbd>Space</kbd>+<kbd>gfc</kbd> | Telescope git commits for current file/buffer |
| Normal | <kbd>Space</kbd>+<kbd>gb</kbd> | Telescope git branches |
| Normal | <kbd>Space</kbd>+<kbd>gs</kbd> | Telescope git status |
| Normal | <kbd>Ctrl</kbd>+<kbd>k</kbd> | Telescope move selection previous |
| Normal | <kbd>Ctrl</kbd>+<kbd>j</kbd> | Telescope move selection next |
| Normal | <kbd>Ctrl</kbd>+<kbd>q</kbd> | Telescope send selected to qflist and open qflist |
| Normal | <kbd>Ctrl</kbd>+<kbd>b</kbd> | Cmp mapping scroll docs up | 
| Normal | <kbd>Ctrl</kbd>+<kbd>f</kbd> | Cmp mapping scroll docs down | 
| Normal | <kbd>Ctrl</kbd>+<kbd>Space</kbd> | Cmp mapping complete | 
| Normal | <kbd>Ctrl</kbd>+<kbd>e</kbd> | Cmp mapping abort | 
| Normal | <kbd>Tab</kbd> | Cmp snippet select next item | 
| Normal | <kbd>Shift</kbd>+<kbd>Tab</kbd>  | Cmp snippet select previous item | 

