----------------------------------------------------------
--        lualine          --    Строка статуса снизу   --
----------------------------------------------------------
require("lualine").setup {
  options = {
    globalstatus = true,                                 -- Единая строка статуса внизу 
    theme = "auto",                                      -- Тема
  },
  sections = {
    lualine_a = { "mode" },                              -- Режим NORMAL/INSERT/…
    lualine_b = { "filename" },                          -- Имя файла
    lualine_c = { "branch" },                            -- Ветка git
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

-----------------------------------------------------------
--        bufferline       --    Вкладки буферов сверху  --
-----------------------------------------------------------
require("bufferline").setup {
  options = {
    mode = "buffers",                                    -- Показывать буферы как вкладки
    separator_style = "slope",
    color_icons = true,                                  -- Показывать цветные иконки
    show_buffer_icons = true,                            -- Показывать иконки файлов в вкладке
    show_buffer_close_icons = false,                     -- Не показывать иконку закрытия (крестик)
    move_wraps_at_ends = true,                           -- Зацикленный переход между вкладками
    always_show_bufferline = false,                      -- Если буфер один, строка вкладок не показывается
    numbers = "ordinal",                                 -- Показывать порядковые номера вкладок
    indicator = {
      style = 'underline',                               -- Подсветка активного буфера снизу
    },
  },
}

-----------------------------
--        TERMINAL         --
-----------------------------
require("toggleterm").setup({
  size = 15,                                          -- Высота терминала
  open_mapping = [[<leader>t]],                       -- Сочетание клавиш для открытия/закрытия терминала
  hide_numbers = true,                                -- Скрывать номера строк
  start_in_insert = true,                             -- Сразу входить в режим ввода
  insert_mappings = true,                             -- Разрешить хоткеи 
  persist_size = true,                                -- 
  direction = "horizontal",                           -- Расположение терминала снизу горизонтальное
  close_on_exit = true,                               -- Выход при вводе 'exit'
  shell = vim.o.shell,                                -- Использовать системный shell
})

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])          -- Выход из terminal mode в normal mode по Esc

-----------------------------
--           oil           --
-----------------------------
require("oil").setup({
  -- Общие настройки
  default_file_explorer         = true,                -- Oil открывается при 'nvim .' или :e папка
  delete_to_trash               = false,               -- Удаление сразу полностью, без корзины
  skip_confirm_for_simple_edits = true,                -- Не показывать подтверждающие окна для простых операций
  -- Что показывать слева от директории/файла
  columns = {                    
    "permissions",                                     -- Права доступа
    "size",                                            -- Размер
    "icon",                                            -- Иконка
  },
})

-----------------------------
--       scrollbar         --
-----------------------------
require("scrollbar").setup({
  hide_if_all_visible = false,
})

-----------------------------
--       gitsigns          --
-----------------------------
require("gitsigns").setup({})

-----------------------------
--      langmapper         --
-----------------------------
require("langmapper").setup({
  map_all_ctrl = true,
})

-----------------------------
--        THEME            --
-----------------------------
require("tokyonight").setup({
  style = "night",                    -- Выбрал его как самый контрастный и темный
  transparent = false,                -- Фон не прозрачный
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
})

vim.cmd.colorscheme("tokyonight")

-----------------------------
--    indent-blankline     --
-----------------------------
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed",     { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow",  { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue",    { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange",  { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen",   { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet",  { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan",    { fg = "#56B6C2" })
end)

require("ibl").setup {
  indent = {
    highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowGreen",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowViolet",
      "RainbowCyan",
    },
	},
}
