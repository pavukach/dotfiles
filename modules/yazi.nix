{ pkgs, ... }:
let
  make-keymap = on: command: desc: { inherit on command desc; };
  make-keymap-s = on: command: { inherit on command; };
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
          (make-keymap-s "l" "plugin smart-enter")
          (make-keymap-s "<C-y>" ''shell -- dragon-drop -x -i -T "$1"'')
          (make-keymap-s "P" "shell -- wl-paste > pasted")
          (make-keymap-s "y" [
            ''shell -- for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list''
            "yank"
          ])
          (make-keymap-s "<C-o>" "shell -- setsid nemo . ")
          (make-keymap-s "d" [
            "escape --visual"
            ''shell -- trash-put "$@"''
          ])
          (make-keymap-s "!" ''shell "$SHELL" --block'')

          (make-keymap [ "R" "o" ] "plugin recycle-bin -- open" "Open Bin")
          (make-keymap [ "R" "e" ] "plugin recycle-bin -- empty" "Clear Bin")
          (make-keymap [ "R" "D" ] "plugin recycle-bin -- emptyDays" "Clear Bin (days)")
          (make-keymap [ "R" "d" ] "plugin recycle-bin -- delete" "Delete From Bin")
          (make-keymap [ "R" "r" ] "plugin recycle-bin -- restore" "Restore File")

          (make-keymap [ "c" "a" "a" ] "plugin compress" "Compress")
          (make-keymap [ "c" "a" "p" ] "plugin compress -p" "Compress (password)")
          (make-keymap [ "c" "a" "h" ] "plugin compress -ph" "Compress (pass+header)")
          (make-keymap [ "c" "a" "l" ] "plugin compress -l" "Compress (level)")
          (make-keymap [ "c" "a" "u" ] "plugin compress -phl" "Compress (pass+header+level)")
        ];
      };
      pick = {
        prepend_keymap = [
          (make-keymap-s "<C-n>" "arrow next")
          (make-keymap-s "<C-p>" "arrow prev")
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
