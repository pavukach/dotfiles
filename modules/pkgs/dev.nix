{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    marksman
    statix
    clang-tools
    rust-analyzer

    flutter
    nodejs
    python315
    dotnet-sdk
    gcc
    dart
    supabase-cli
    rustc
    cargo
    jdk
    godot
    ruby

    gnumake
    cmake

    ollama-vulkan
  ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
  systemd.services.docker.wantedBy = lib.mkForce [ ];
}
