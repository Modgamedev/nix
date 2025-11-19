{ config, pkgs, ... }:

{
  boot = {
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
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
