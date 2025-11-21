{ config, pkgs, lib, ... }:

let
  usbUUID = "C5DA-9DE0";
  mountPoint = "/home/mod/usb";
in

{
  # Монтирование флешки
  fileSystems.${mountPoint} = {
    device = "/dev/disk/by-uuid/${usbUUID}";
    fsType = "auto";
    options = [ "defaults" "uid=1000" "gid=100" "umask=022" ];
    autoFormat = false;
  };

  # Автомонтирование через systemd при вставке
  systemd.automounts.${mountPoint} = {
    where = mountPoint;
    description = "Автомонт флешки USB для mod";
    bindsTo = [ "dev-disk-by\x2duuid-${lib.replaceStrings [ "-" ] [ "\\x2d" ] usbUUID}.device" ];
    automountConfig = {
      DirectoryMode = "0700";
    };
  };
}

