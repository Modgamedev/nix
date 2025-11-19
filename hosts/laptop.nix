{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix  # конфиг разделов диска и файловых систем
    ./modules/users.nix   # модуль пользователя
  ];

  networking.hostName = "nixos-laptop";
  system.stateVersion = "25.05";
  time.timeZone = "UTC";

  # Настройка загрузчика
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
