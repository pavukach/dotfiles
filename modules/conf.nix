{
  pkgs,
  self,
  pkgsConfig,
  ...
}:
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 5";
    flake = self.outPath;
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };
  nixpkgs.config = pkgsConfig;
  nixpkgs.overlays = [
    (final: _prev: {
      pnpm_10_29_2 = final.pnpm_10;
    })
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      openssl
      curl
    ];
  };

  documentation.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  zramSwap.enable = true;
  services.earlyoom.enable = false;
  systemd.oomd.enable = true;
  boot.tmp.cleanOnBoot = true;

  networking.hostName = "nixos";
  system.stateVersion = "25.11";
}
