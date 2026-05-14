# Nix files

## Description

Basically my personal files for nixos

## Usage

### Cloning

run following command:

```
git clone https://github.com/BbIXOD/dotfiles ~/nixos
```

### Configuring

After cloning the repo check the host folder.
It contains machine-specific config.
Replace `hardware-configuration.nix` with your own.
Review other files there.

`flake.nix` has some variables like username,
you may want to change them.

### Rebuilding

```
cd ~/nixos/
sudo nixos-rebuild switch \
  --extra-experimental-features 'nix-command flakes' \
  --flake . \
  --impure
```

After first rebuild you can use `rebuild` script (pass -u to update)

### Post install manual steps

- ofc steam and bottles are manual
- prob get wallpapers
- reduce mic internal boost with aslactl

## Home manager standalone

I aim to not differentiate home manager config with nixos config, so not.
