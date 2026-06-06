{ pkgs, ... }:
let
  make-keymap = on: command: { inherit on command; };
  make-icon = name: text: { inherit name text; };
in
{
  hm.programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    initLua = ../config/yazi.lua;
    settings = {
      opener = {
        krita = [
          {
            run = ''krita "$@"'';
            orphan = true;
            desc = "krita";
            block = false;
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            mime = "image/*";
            use = [
              "open"
              "krita"
              "reveal"
            ];
          }
        ];
      };
    };
    keymap = {
      mgr = {
        prepend_keymap = [
          (make-keymap "l" "plugin smart-enter")
          (make-keymap "<C-y>" ''shell -- dragon-drop -x -i -T "$1"'')
          (make-keymap "P" "shell -- wl-paste > pasted")
          (make-keymap "y" [
            ''shell -- for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list''
            "yank"
          ])
          (make-keymap "<C-o>" "shell -- setsid nemo . ")
          (make-keymap "d" [
            "escape --visual"
            ''shell -- trash-put "$@"''
          ])
          (make-keymap "!" ''shell "$SHELL" --block'')

          (make-keymap [ "R" "o" ] "plugin recycle-bin -- open")
          (make-keymap [ "R" "e" ] "plugin recycle-bin -- empty")
          (make-keymap [ "R" "D" ] "plugin recycle-bin -- emptyDays")
          (make-keymap [ "R" "d" ] "plugin recycle-bin -- delete")
          (make-keymap [ "R" "r" ] "plugin recycle-bin -- restore")

          (make-keymap [ "c" "a" "a" ] "plugin compress")
          (make-keymap [ "c" "a" "p" ] "plugin compress -p")
          (make-keymap [ "c" "a" "h" ] "plugin compress -ph")
          (make-keymap [ "c" "a" "l" ] "plugin compress -l")
          (make-keymap [ "c" "a" "u" ] "plugin compress -phl")
        ];
      };
      pick = {
        prepend_keymap = [
          (make-keymap "<C-n>" "arrow next")
          (make-keymap "<C-p>" "arrow prev")
        ];
      };
    };
    theme = {
      icon = {
        dirs = [
          (make-icon "downloads" "󰉍")
          (make-icon "projects" "󰲋")
          (make-icon "documents" "󰲂")
          (make-icon "music" "󱍙")
          (make-icon "pictures" "󰉏")
          (make-icon "videos" "󱧺")
          (make-icon "public" "󰉌")
          (make-icon "templates" "󰉓")
          (make-icon "bin" "󱁿")
          (make-icon ".git" "")
          (make-icon "nixos" "")
          (make-icon "node_modules" "")
        ];
      };
    };
    plugins = {
      inherit (pkgs.yaziPlugins)
        compress
        recycle-bin
        smart-enter
        smart-paste
        ;
    };
  };
}
