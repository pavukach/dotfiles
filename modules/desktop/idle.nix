{ pkgs, ... }:
{
  hm.services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 20 * 60;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
