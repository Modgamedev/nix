{ config, pkgs, lib, ... }:

# https://github.com/catppuccin/cursors
{
  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors;;
    name = "Catppuccin-Cursors-Mocha-Dark";
    size = 36;
    gtk.enable = true;
  };
}
