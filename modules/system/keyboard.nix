{ ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            # esc = "capslock";
            rightalt = "layer(nav)";
          };
          nav = {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          };
        };
        extraConfig = "";
      };
    };
  };

}
