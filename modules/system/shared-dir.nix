{ ... }:
{
  systemd.tmpfiles.rules = [
    "d /srv/shared 2777 root root -"
  ];
}
