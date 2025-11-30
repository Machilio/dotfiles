-- Core neovim options
local opt = vim.opt

-- Terminal integration
opt.shell = vim.fn.executable('zsh') and 'zsh' or 'bash'

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Clipboard fix for Wayland/Hyprland
if vim.fn.has('wsl') == 0 then
  vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = { ['+'] = 'wl-copy', ['*'] = 'wl-copy' },
    paste = { ['+'] = 'wl-paste', ['*'] = 'wl-paste' },
  }
end

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Behavior
opt.splitright = true
opt.splitbelow = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
