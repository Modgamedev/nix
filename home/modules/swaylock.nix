{ config, pkgs, lib, ... }:

{
  services.swayidle = {
    enable = true;
    events = [
      {
      event = "timeout 60";
      command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
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
