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
    git-crypt
    gemini-cli
    qwen-code
    cursor-cli
    github-copilot-cli

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
    lazygit
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

  # services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = with pkgs; pinentry-gtk2;
    enableSSHSupport = true;
  };

  programs.firejail.enable = true;
}
