-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "s")
local function toggle_true_false()
  local _row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  -- sütun bazlı kelime arama
  local start_col, end_col = line:find("true", col + 1)
  local start_col2, end_col2 = line:find("True", col + 1)
  if start_col then
    -- true ise false yap
    line = line:sub(1, start_col - 1) .. "false" .. line:sub(end_col + 1)
  elseif start_col2 then
    line = line:sub(1, start_col2 - 1) .. "False" .. line:sub(end_col2 + 1)
  else
    start_col, end_col = line:find("false", col + 1)
    start_col2, end_col2 = line:find("False", col + 1)
    if start_col then
      -- false ise true yap
      line = line:sub(1, start_col - 1) .. "true" .. line:sub(end_col + 1)
    elseif start_col2 then
      line = line:sub(1, start_col2 - 1) .. "True" .. line:sub(end_col2 + 1)
    else
      return -- ne true ne false bulundu
    end
  end

  vim.api.nvim_set_current_line(line)
end
vim.keymap.set("n", "ss", toggle_true_false, { noremap = true, silent = true })
