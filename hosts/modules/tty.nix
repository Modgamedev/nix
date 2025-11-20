{ config, lib, ... }:

{
  services.getty = {
    greetingLine = lib.mkForce "NixOS ${config.system.nixos.release} - \l";    # Выводим сообщение о канале NixOS и номере tty
    helpLine = lib.mkForce "";                                                 # Убираем helpline
  };
  console = {
    enable = true;         # Включен по умолчанию, но пусть будет
    keyMap = "us";         # Раскладка клавиатуры
  };
}
