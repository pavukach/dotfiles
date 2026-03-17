{ ... }:
let
  workspace-rules =
    {
      name,
      workspace,
      class-patterns ? [ ],
      title-patterns ? [ ],
      ...
    }:

    let
      workspace-id = toString workspace;

      normalize-pattern =
        p:
        let
          regex = builtins.replaceStrings [ "*" ] [ ".*" ] p;
        in
        "^${regex}$";

      mk-rule = key: pattern: {
        name = "${name}-${key}-${pattern}";
        "match:${key}" = normalize-pattern pattern;
        workspace = workspace-id;
      };
    in
    (map (mk-rule "class") class-patterns) ++ (map (mk-rule "title") title-patterns);

in
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      {
        name = "fix-xwayland-drags";
        "match:class" = "^$";
        "match:title" = "^$";
        "match:xwayland" = true;
        "match:float" = true;
        "match:fullscreen" = false;
        "match:pin" = false;
        no_focus = true;
      }
      {
        name = "suppress-maximize-events";
        "match:class" = ".*";
        suppress_event = "maximize";
      }
      {
        name = "neovim-border-color";
        "match:tag" = "neovim";
      }
      {
        name = "keep-render-games";
        "match:class" = "^(steam_app_.*|gamescope|SteamGame)$";
        render_unfocused = true;
      }
    ]
    ++ workspace-rules {
      name = "social";
      workspace = 4;
      class-patterns = [
        "vesktop"
        "com.ayugram.desktop"
      ];
    }
    ++ workspace-rules {
      name = "browser";
      workspace = 1;
      class-patterns = [ "helium" ];
    }
    ++ workspace-rules {
      name = "games";
      workspace = 5;
      class-patterns = [
        "steam_app_*"
        "gamescope"
        "SteamGame"
        "steam"
      ];
    };

    layerrule = [
      {
        name = "region-selector";
        "match:namespace" = "noctalia-shell:regionSelector";
        no_anim = true;
      }
    ];
  };
}
