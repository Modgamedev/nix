{ config, pkgs, ... }:

{
  services.getty = {
    greetingLine = "Welcome to NixOS";
    helpLine = "";
  };
  console = {
    enable = true;         # Включен по умолчанию, но пусть будет
    keyMap = "us";         # Раскладка клавиатуры
  };
}
