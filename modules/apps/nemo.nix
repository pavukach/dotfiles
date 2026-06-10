{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nemo-with-extensions
  ];

  hm = {
    xdg.desktopEntries.nemo = {
      name = "Nemo";
      icon = "nemo";
      exec = "${pkgs.nemo-with-extensions}/bin/nemo";
    };

    dconf.settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "ghostty";
      };
      "org/cinnamon/desktop/interface" = {
        can-change-accels = true;
      };

    };

    home.file = {
      ".gnome2/accels/nemo".text = ''
        (gtk_accel_path "<Actions>/DirViewActions/OpenInTerminal" "F4")
      '';
    };
  };
}
