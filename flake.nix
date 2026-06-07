{
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } import ./entry.nix;
}
