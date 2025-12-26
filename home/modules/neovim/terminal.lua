-- глобальная переменная для терминального буфера
_G.float_term_bufnr = nil

function _G.toggle_floating_term()
  -- если буфер существует и валиден
  if float_term_bufnr and vim.api.nvim_buf_is_valid(float_term_bufnr) then
    -- если терминал уже открыт в окне — закрываем это окно
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == float_term_bufnr then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end

  -- если буфера нет — создаём новый
  if not float_term_bufnr or not vim.api.nvim_buf_is_valid(float_term_bufnr) then
    float_term_bufnr = vim.api.nvim_create_buf(false, true)
  end

  -- размеры и позиции флоата
  local width  = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines   * 0.8)
  local row    = math.floor((vim.o.lines  - height) / 2)
  local col    = math.floor((vim.o.columns - width)  / 2)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }

  -- открываем окно
  vim.api.nvim_open_win(float_term_bufnr, true, opts)

  -- если терминал не запущен — запускаем shell
  local ok = pcall(vim.api.nvim_buf_get_var, float_term_bufnr, "terminal_job_id")
  if not ok then
    vim.fn.termopen(vim.o.shell)
  end

  vim.cmd("startinsert")

  -- общие opts для биндингов
  local key_opts = { silent = true, buffer = float_term_bufnr }

  -- ESC закрывает окно
  vim.keymap.set("t", "<Esc>", [[<C-\><C-n>:close<CR>]], key_opts)

  -- leader+t закрывает окно (toggle)
  vim.keymap.set("t", "<leader>t", [[<C-\><C-n>:close<CR>]], key_opts)
end

-- opts для normal-mode биндинга
local normal_opts = { silent = true }

-- leader+t = toggle floating terminal
vim.keymap.set("n", "<leader>t", toggle_floating_term, normal_opts)

