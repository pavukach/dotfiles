{ lib, ... }:
let
  mimeFor =
    app: category: exts:
    builtins.listToAttrs (
      map (ext: {
        name = "${category}/${ext}";
        value = [ app ];
      }) exts
    );
in
{
  xdg = {
    configFile."user-dirs.dirs".force = true;
    userDirs = {
      enable = true;
      setSessionVariables = true;
      createDirectories = true;

      documents = "$HOME/docs";
      download = "$HOME/downloads";
      music = "$HOME/media/music";
      pictures = "$HOME/media/pictures";
      videos = "$HOME/media/videos";
      desktop = "$HOME/tmp";
      templates = "$HOME/tmp";
      publicShare = "$HOME/public";
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications =
        (mimeFor "org.kde.gwenview.desktop" "image" [
          "png"
          "jpeg"
          "jpg"
          "gif"
          "webp"
          "bmp"
          "tiff"
        ])
        // (mimeFor "vlc.desktop" "video" [
          "mp4"
          "mkv"
          "webm"
          "avi"
          "mov"
        ])
        // (mimeFor "vlc.desktop" "audio" [
          "mp3"
          "flac"
          "wav"
          "ogg"
          "m4a"
        ])
        // (mimeFor "nvim.desktop" "text" [
          "plain"
          "markdown"
          "x-python"
          "x-csrc"
          "x-c++src"
          "html"
          "css"
        ])
        // (mimeFor "helium.desktop" "x-scheme-handler" [
          "http"
          "https"
          "ftp"
        ])
        // (mimeFor "startcenter.desktop" "application" [
          "msword"
          "vnd.openxmlformats-officedocument.wordprocessingml.document"
          "vnd.ms-excel"
          "vnd.openxmlformats-officedocument.spreadsheetml.sheet"
          "vnd.ms-powerpoint"
          "vnd.openxmlformats-officedocument.presentationml.presentation"
          "vnd.oasis.opendocument.text"
          "vnd.oasis.opendocument.spreadsheet"
          "vnd.oasis.opendocument.presentation"
          # "epub+zip"
          "rtf"
        ])
        // {
          "application/pdf" = [ "org.kde.okular.desktop" ];
          "inode/directory" = [ "yazi.desktop" ];
          "x-scheme-handler/terminal" = [ "kitty.desktop" ];
          "text/html" = [ "helium.desktop" ];
        };
    };
  };
}
