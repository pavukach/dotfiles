{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.helium.packages.${stdenv.hostPlatform.system}.helium-nightly
    libreoffice
    vlc
    krita
    qbittorrent
    qalculate-qt
    qimgv
    kdePackages.kdenlive
    kdePackages.okular
    kdePackages.partitionmanager
    freetube
    # winboat
    vscode

    obs-studio
    deepfilternet
    easyeffects

    ayugram-desktop
    vesktop
    zoom-us
  ];
  programs.neovim.enable = true;
}
