{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    gemini-cli
    qwen-code

    eza
    bat
    fd
    ripgrep
    fzf
    zoxide
    starship
    btop
    gdu
    fastfetch
    tldr
    plocate
    unixtools.netstat
    fortune

    tree
    jq
    libarchive
    libqalculate
    nix-tree
    calibre
    alsa-utils
    tintin
    hyprpicker

    atool
    rar
    unrar
    zip
    unzip
    p7zip
  ];
}
