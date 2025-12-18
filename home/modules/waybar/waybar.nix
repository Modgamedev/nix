{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    ###########################
    ###  Общие настройки    ###
    ###########################
    enable = true;                                        # Включаем waybar
  	style = ./style_waybar.css;                           # Относительный путь к CSS файлу
    settings = {                                        
      mainBar = {
        position = "top";                                 # Позиция waybar сверху
        height = 20;                                      # Высота waybar
	    	spacing = 10;                                     #

        ##############################
        ###  Расположение модулей  ###
        ##############################
        modules-left = [ "cpu" "memory" "temperature" "disk" "battery" "network" ];
        modules-center = [ ];
        modules-right = [ "niri/language" ];

        ###########################
        ###  Настройки модулей  ###
        ###########################
        ###         CPU         ###
        ###########################
        "cpu" = {
          ##-------Базовые-------##
	        interval = 10;                                  # Частота опроса в секундах
          ##-----Отображение-----##
	        format = "  {usage}%";                        # Основное отображение
          ##------Состояния------##
	        states = {
	          medium = 50;                                  # Загрузка 50%
	          high = 70;                                    # Загрузка 70%
	          critical = 90;                                # Загрузка 90%
	        };
          ### Тултип ###
		      tooltip = false;                                # Отключаем тултип
		    };

        ###########################
        ###         RAM         ###
        ###########################
    	  "memory" = {
          ##-------Базовые-------##
		      interval = 10;                                  # Частота опроса в секундах
          ##-----Отображение-----##
		      format = "  {percentage}%";                   # Основное отображение
		      format-alt = "  {used}GiB";                   # Альтернативное отображение (смена на ЛКМ)
          ##------Состояния------##
		      states = {
	        	medium = 50;                                  # Загрузка 50%
	          high = 70;                                    # Загрузка 70%
	    	    critical = 90;                                # Загрузка 90%
		      };
          ##-------Тултип--------##
		      tooltip = true;                                 # Включаем тултип
    	    tooltip-format = "Total RAM: {total} GiB\nUsed: {used} GiB\n\nTotal SWAP: {swapTotal} GiB\nUsed SWAP: {swapUsed} GiB";
        };

		    ###########################
        ###     Temperature     ###
        ###########################
        "temperature" = {
          ##-------Базовые-------##
		      interval = 10;                                  # Частота опроса в секундах
		      thermal-zone = 22;                              # 
		      critical-threshold = 70;                        # Значение критической температуры в градусах цельсия
          ##-----Отображение-----##
          format = " {temperatureC}°";                  # Отображение, когда температура ниже критической
		      format-critical = " {temperatureC}°";         # Отображение, когда температура выше критической (смена иконки)
          ##-------Тултип--------##
		      tooltip = false;                                # Отключаем тултип
    	  };

		    ###########################
        ###        Disk         ###
        ###########################
    	  "disk" = {
          ##-------Базовые-------##
		      interval = 60;                                  # Частота опроса в секундах
          unit = "GB";                                    #
          ##-----Отображение-----##
		      format = "󰋊 {specific_used:.0f}GB";            # Основное отображение
		      format-alt = "󰋊 {percentage_used}%";           # Альтернативное отображение (смена на ЛКМ)
          ##-------Тултип--------##
		      tooltip = true;                                 # Включаем тултип
		      tooltip-format = "Размер диска:{specific_total:.1f}GB\nСвободно:{specific_free:.1f}GB({percentage_free}%)\nИспользовано:{specific_used:.1f}GB({percentage_used}%)";
    	  };

    	  ###########################
        ###      Battery        ###
        ###########################
    	  "battery" = {
          ##-------Базовые-------##
		      interval = 60;                                  # Частота опроса в секундах
		      design-capacity = false;                        # Использовать текущую ёмкость, не проектную ???
          ##-----Отображение-----##
		      format = "{icon} {capacity}%";		              # Основное отображение
		      format-alt = "{icon} {power}W";                 # Альтернативное отображение (смена на ЛКМ)
		      format-charging = "󰂄 {capacity}%";             # Отображение во время зарядки (смена иконки)
		      format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];     # Иконки батареи для разных уровней
          ##------Состояния------##
          states = {
	    	    medium = 50;                                  # 50% заряда
	    	    critical = 20;                                # 20% заряда
		      };
          ##-------Тултип--------##
          tooltip = true;                                 # Включаем тултип
		      tooltip-format-charging = "До полной зарядки: {time}\nЗдоровье: {health}%\nЦиклов: {cycles}";
		      tooltip-format-discharging = "Потребляет: {power}W\nОсталось работы: {time}\nЗдоровье: {health}%\nЦиклов: {cycles}";
    	  };

    	  ###########################
        ###      Network        ###
        ###########################
    	  "network" = {
          ##-------Базовые-------##
          interval = 30;                                    # Частота опроса в секундах
          ##-----Отображение-----##
          format-wifi = "{icon} {signalStrength}%";         # Отображение когда подключен по Wi-Fi
		      format-alt = "{icon}  {bandwidthDownBytes}  {bandwidthUpBytes}";      # Альтернативное отображение (смена на ЛКМ)
		      format-ethernet = "󰈀";                           # Отображение, когда подключен по проводу
		      format-linked = "󰤬";                             # Отображение, когда подключен, но нет ip
		      format-disconnected = "󰤮";                       # Отображение, когда не подключен
		      format-disabled = "󰤫";                           # Отображение, когда интерфейс выключен
		      format-icons = [ "󰤮" "󰤟" "󰤢" "󰤥" "󰤨" ];     # Иконки уровней сигнала Wi-Fi
          ##-------Тултип--------##
		      tooltip = true;                                    # Включаем тултип
		      tooltip-format = "WiFi: {essid} ({frequency} GHz)\n\nИмя интерфейса: {ifname}\n󰩟  {ipaddr}\nШлюз: {gwaddr}\nМаска IPv4: {netmask}(/{cidr})\n\n  {bandwidthDownBytes}   {bandwidthUpBytes}";
		      tooltip-format-wifi = "WiFi: {essid} ({frequency} GHz)\n\nИмя интерфейса: {ifname}\n󰩟  {ipaddr}\nШлюз: {gwaddr}\nМаска IPv4: {netmask}(/{cidr})\n\n  {bandwidthDownBytes}   {bandwidthUpBytes}";
		      tooltip-format-disconnected = "WiFi disconnected";
		      tooltip-format-disabled = "WiFi interface disabled";
    	  };
    	  ###########################
        ###      Language       ###
        ###########################
    	  "niri/language" = {
          ##-----Отображение-----##
		      format-en = "EN";                                 # Отображение, когда раскладка русская
		      format-ru = "РУ";                                 # Отображение, когда раскладка английская
    	  };
      };
    };
  };
}
