{ config, pkgs, lib, ... }:

{
  programs.foot = {
    ###########################
    ###  Общие настройки    ###
    ###########################
    enable = true;                                                # Включить терминал foot
    settings = {
      main = {
        font = "IosevkaTerm NFM:weight=Light:size=11";            # Шрифт, вид, размер
        dpi-aware = "yes";                                        #
      };

      ###########################
      ###        Курсор       ###
      ###########################
      cursor = {
        style = "beam";                                           #
        unfocused-style = "none";                                 #
        blink = "yes";                                            # Мигание курсора
        blink-rate = 500;                                         # Частота мигания
        beam-thickness = 1.0;                                     # 
      };

      ###########################
      ###      Прокрутка      ###
      ###########################
      scrollback = {
        lines = 1000;                                             #
        multiplier = 8.0;                                         #
        indicator-position = "relative";                          #
      };

      ###########################
      ###        Цвета        ###
      ###########################
      colors = {
        background = "1a1b26";                                    # Фон (Tokyonight)
        foreground = "c0caf5";                                    # Основной текст (Tokyonight)
      };

      ###########################
      ###        Бинды        ###
      ###########################
      key-bindings = {
        clipboard-copy = "Control+Shift+c XF86Copy";              # Копировать текст
        clipboard-paste = "Control+Shift+v XF86Paste";            # Вставить текст
      };
    };
  };
}
