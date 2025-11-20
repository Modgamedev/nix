{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;    # Включаем fontconfig, чтобы программы видели шрифты из home.packages

  home.packages = with pkgs; [
    nerd-fonts.iosevka-term
  ];
}
