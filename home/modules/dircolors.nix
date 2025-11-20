{ config, pkgs, lib, ... }:

{
  programs.dircolors = {
    enable = true;
    settings = {
      DIR = "33";              # папки — обычный желтый
    };
  };
}
