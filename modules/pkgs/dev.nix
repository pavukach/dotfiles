{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    marksman
    clang-tools

    flutter
    nodejs
    deno
    python315
    dotnet-sdk_10
    dotnet-sdk
    gcc
    dart
    supabase-cli
    rustc
    cargo
    jdk
    godot

    gnumake
    cmake
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
