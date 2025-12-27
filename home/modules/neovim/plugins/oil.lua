--#########################-------------------------------------------
--      Плагин: oil      ##     Файловый менеджер (буфферный)       --
--#########################-------------------------------------------
require("oil").setup({
  -- 1. Общие настройки --
  default_file_explorer           = true,         -- Файловый менеджер по умолчанию
  skip_confirm_for_simple_edits   = true,         -- Не показывать подтверждения для простых операций
  delete_to_trash                 = false,        -- Удаление в корзину (false - перманентно)
  use_default_keymaps             = false,        -- Использовать стандартные биндинги
  watch_for_changes               = true,         -- Отслеживать изменения файлов
  columns                         = { "icon" },   -- Что показывать слева от директории/файла
  -- 2. Настройки буфера oil -- 
  win_options = {
    wrap = false,                                 -- Перенос строк 
  },
  -- 3. Как отображаются файлы и директории --
  view_options = {
    show_hidden                 = true,           -- Показывать скрытые файлы
    -- 3.1 Какие файлы всегда скрывать --
    is_always_hidden = function(name, bufnr)
      return name == ".."                         -- Список "что не показывать"
    end,
  },
  -- 4 Настройки плавающего окна --
  float = {
    preview_split = "right",                      -- Где показывать окно предпросмотра в сплите
    border        = "rounded",                    -- Стиль рамки
    max_width     = 0.8,                          -- Размер максимум 80% от ширины экрана
    max_height    = 0.8,                          -- Размер максимум 80% от высоты экрана
  },
  -- 5. Автоматическое обновление git-индекса при работе с файлами в Oil --
  git = {
    add = function() return true end,             -- Включить автоматический `git add` при создании/добавлении файлов
    mv  = function() return true end,             -- Включить автоматический `git mv` при перемещении/переименовании файлов
    rm  = function() return true end,             -- Включить автоматический `git rm` при удалении файлов
  },
  -- 6. Биндинги в буфере oil --
  keymaps = {
    ["<Esc>"] = "actions.close",                  -- (ESC) Закрыть буфер Oil
    ["<CR>"]  = "actions.select",                 -- (Enter) Открыть файл/зайти в директорию
    ["gx"]    = "actions.open_external",          -- Открывать файлы в ассоциирующихся программах 
    ["."]     = "actions.toggle_hidden",          -- (.) Показать/скрыть скрытые файлы
  },
})
-- 7. Биндинги глобальные Neovim--
-- 7.1 Открытие oil в текущей директории на "-" --
vim.keymap.set("n", "-", function()                             -- Нормальный режим, клавиша "-"
  return vim.bo.filetype == "oil"                               -- Если текущий буфер oil
    and vim.cmd("Oil")                                          -- Выполнить команду :Oil (подняться на уровень выше) 
    or require("oil").open_float(vim.fn.expand("%:p:h"))        -- Иначе открыть oil в текущей директории в флоат окне 
end)
-- 8. Настройка хайлайтсов --
local hl = vim.api.nvim_set_hl                                      -- Переменная
-- 8.1 oil хайлайтсы --
hl(0, "OilHidden",           { fg = "#3F4257", italic = false })    -- Общее для скрытых
hl(0, "OilFile",             { fg = "#C0CAF5" })                    -- Обычные файлы
hl(0, "OilDir",              { fg = "#F5D76E" })                    -- Имена директорий
hl(0, "OilDirIcon",          { fg = "#F5D76E" })                    -- Иконки директорий
hl(0, "OilDirHidden",        { fg = "#8F8552" })                    -- Имена скрытых директорий
hl(0, "OilLink",             { fg = "#7EC699" })                    -- Имена обычных символических ссылок
hl(0, "OilLinkHidden",       { fg = "#4B7355" })                    -- Имена скрытых символических ссылок
hl(0, "OilOrphanLink",       { fg = "#FF6C6B" })                    -- Имена обычных сиротских ссылок
hl(0, "OilOrphanLinkHidden", { fg = "#8B2F2F" })                    -- Имена скрытых сиротских ссылок
-- 8.2 oil-git хайлайтсы --
hl(0, "OilGitAdded",         { fg = "#9ece6a" })                    -- + Добавленные файлы
hl(0, "OilGitModified",      { fg = "#e0af68" })                    -- ~ Изменённые файлы
hl(0, "OilGitRenamed",       { fg = "#bb9af7" })                    -- → Переименованные
hl(0, "OilGitUntracked",     { fg = "#7aa2f7" })                    -- ? Неотслеживаемые
hl(0, "OilGitIgnored",       { fg = "#787c99" })                    -- ! Игнорируемые

-- TODO настройка LSP
