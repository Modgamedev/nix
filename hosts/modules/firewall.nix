{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;                    # Включаем фаервол
    package = pkgs.nftables;          # Используем nftables вместо iptables
    allowedTCPPorts = [ 58585 ];      # Открытые TCP порты
    allowedUDPPorts = [  ];           # Открытые UDP порты
    allowPing = false;                # Отключаем пинги
  };
}
