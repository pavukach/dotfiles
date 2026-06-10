_:
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
  hm.xdg = {
    configFile."user-dirs.dirs".force = true;
    userDirs = {
      enable = true;
      setSessionVariables = true;
      createDirectories = true;

      download = "$HOME/downloads";
      projects = "$HOME/projects";
      documents = "$HOME/documents";
      music = "$HOME/music";
      pictures = "$HOME/pictures";
      videos = "$HOME/videos";
      desktop = "$HOME/desktop";
      templates = "$HOME/templates";
      publicShare = "$HOME/public";
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications =
        (mimeFor "qimgv.desktop" "image" [
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
