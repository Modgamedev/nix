{ config, pkgs, ... }:

{
  boot = {
    consoleLogLevel = 3;
    loader = {
      timeout = 0;                        # Длительность показа консоли
      systemd-boot = {                    # Определяем какой загрузчик
        enable = true;                    # Включаем загрузчик systemd-boot
        editor = false;                   # Отключаем редактирование командной строки ядра перед загрузкой
        configurationLimit = 20;          # Сколько поколений отображается при загрузке
        consoleMode = "max";              # ставим максимальное разрешение консоли
      };
      efi.canTouchEfiVariables = true;    # Разрешаем NixOS управлять EFI-загрузочными записями
    };
  };
}
