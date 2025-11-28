{ config, pkgs, lib, ... }:

{
  services.swayidle = {
    enable = true;
  };

  programs.swaylock = {
    enable = true;
    settings = {
      color = "#1c1c1c";
      indicator = true;
      ring-color = "#a3be8c";
    };
  };
}
