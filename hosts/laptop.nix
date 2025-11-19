{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/users.nix   # модуль пользователя
  ];

  networking.hostName = "nixos-laptop";
  system.stateVersion = "25.05";

  time.timeZone = "UTC";
}
