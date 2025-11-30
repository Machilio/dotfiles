-- Neovim config with omarchy-style plugins
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core settings
require("config.options")
require("config.keymaps")

-- Load plugins via lazy.nvim
require("lazy").setup("plugins", {
  change_detection = { notify = false },
  checker = { enabled = false },
})

-- Load theme (reads from ~/.config/theme/current)
require("config.theme")
