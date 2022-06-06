-- ============================================================================
-- Nvim-Tmux Navigation
--
-- Navigate through tmux panes and nvim windows seamlessly using a consistent
-- set of hotkeys.
-- ============================================================================

local M = {}

local config = {
  keybindings = {
    left = "<C-e>h",
    down = "<C-e>j",
    up = "<C-e>k",
    right = "<C-e>l",
  }
}

local function select_pane_cb(dir)
  local tmux_dir = vim.fn.tr(dir, "hjkl", "LDUR")

  local function inner()
    local win_num = vim.api.nvim_win_get_number(0)

    vim.cmd("wincmd " .. dir)

    if win_num == vim.api.nvim_win_get_number(0) then
      os.execute("tmux select-pane -" .. tmux_dir)
    end
  end

  return inner
end

function M.setup(user_config)
  if user_config then
    if user_config.keybindings then
      config.keybindings = user_config.keybindings
    end
  end

  if vim.env.VIM_TMUX_NAV and vim.env.VIM_TMUX_NAV ~= "" then
    vim.keymap.set("n", config.keybindings.left, select_pane_cb("h"))
    vim.keymap.set("n", config.keybindings.down, select_pane_cb("j"))
    vim.keymap.set("n", config.keybindings.up, select_pane_cb("k"))
    vim.keymap.set("n", config.keybindings.right, select_pane_cb("l"))
  end
end

return M
