{ config, pkgs, lib, ... }:

# https://github.com/catppuccin/cursors
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    size = 36;
    gtk.enable = true;
  };
}
