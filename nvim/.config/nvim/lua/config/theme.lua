-- Theme loader - reads current theme from ~/.config/theme/current
local M = {}

local theme_file = vim.fn.expand("~/.config/theme/current")

function M.get_current_theme()
  local f = io.open(theme_file, "r")
  if f then
    local theme = f:read("*l")
    f:close()
    return theme or "catppuccin-mocha"
  end
  return "catppuccin-mocha"
end

function M.apply_theme()
  local theme = M.get_current_theme()

  local theme_map = {
    ["tokyo-night"] = "tokyonight-night",
    ["catppuccin-mocha"] = "catppuccin-mocha",
    ["gruvbox"] = "gruvbox",
  }

  local colorscheme = theme_map[theme] or "catppuccin-mocha"

  local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
  if not ok then
    vim.cmd.colorscheme("default")
  end
end

-- Apply theme on load
M.apply_theme()

-- Create autocmd to watch for theme changes
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    M.apply_theme()
  end,
})

return M
