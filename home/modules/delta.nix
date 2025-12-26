{ config, pkgs, lib, ... }:

{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
