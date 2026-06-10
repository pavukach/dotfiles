{ ... }:
{

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;
    supportedFilesystems = [ "ntfs" ];
    initrd.systemd.enable = true;
  };

}
