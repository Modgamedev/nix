-----------------------------
--     Общие настройки     --
-----------------------------
      vim.opt.number = true              -- Показывать абсолютный номер текущей строки
      vim.opt.relativenumber = true      -- Нумерация остальных строк - относительно текущей строки 
      vim.opt.cursorline = true          -- Выделять текущую строку на которой курсор
      vim.opt.termguicolors = true       -- Включаем поддержку 24-битных цветов
	    vim.opt.wrap = false
      vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,a:blinkon400-blinkoff250"

      -----------------------------
      --    Раскладка русская    --
      -----------------------------
      vim.opt.langmap = "йцукенгшщзфывапролдячсмитьЖ;qwertyuiopasdfghjklzxcvbnm:"                   -- Использование команд vim независимо от раскладки 
      vim.api.nvim_create_autocmd("CmdlineEnter", {                                                 -- переключить раскладку на английскую при вводе команды ":"
        pattern = ":",
        callback = function()
          vim.fn.system("niri msg action switch-layout 0")                                          -- переключаем на английскую расскладку через niri msg
        end,
      })

      -- отступы
      vim.opt.expandtab = true       -- пробелы, а не табы
      vim.opt.tabstop = 2            -- Tab равен 2 пробелам
      vim.opt.shiftwidth = 2         -- отступ уровней 2 пробела
      vim.opt.softtabstop = 2        -- Tab в Insert вводит 2 пробела
      vim.opt.autoindent = true      -- новая строка получает такой же отступ, как предыдущая
      vim.opt.smartindent = true     -- Neovim сам увеличивает отступ после {, if, for и т.п.

      -- бинды
      vim.g.mapleader = " "                                                                  -- ЛИДЕР - пробел
      vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { desc = "Close current buffer" })    -- Закрыть буфер
      vim.keymap.set("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })               -- Следующий буфер (вправо)
      vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })       -- Предыдущий буфер (влево)

      vim.keymap.set("n", "-", function()
        local parent = vim.fn.expand("%:p:h")  -- путь к родительской папке текущего файла
        require("oil").open_float(parent)       -- открываем float
      end, { desc = "Open parent directory in floating Oil" })

      for i = 1, 9 do
        vim.keymap.set(
          "n",
          "<leader>" .. i,
          "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
          { desc = "Go to buffer " .. i }
        )
      end
      vim.opt.clipboard = "unnamedplus"
      -- Вставка из системного буфера
      vim.keymap.set({'n', 'i'}, '<C-v>', '"+p', { silent = true, desc = "Paste from system clipboard" })
      vim.keymap.set('i', '<C-v>', '<C-r>+', { silent = true, desc = "Paste from system clipboard" })

      -- Копирование в системный буфер
      vim.keymap.set({'v', 'i'}, '<C-c>', '"+y', { silent = true, desc = "Copy selection to system clipboard" })
      vim.keymap.set('n', '<C-c>', '"+yy', { silent = true, desc = "Copy current line to system clipboard" })

      -- Переключение в normal mode от бездействия
      vim.opt.updatetime = 8000                       -- время неактивности в ms
      vim.api.nvim_create_autocmd("CursorHoldI", { 
        callback = function()
          vim.cmd("stopinsert")                       -- команда выйти из Insert Mode
      end,
      })
