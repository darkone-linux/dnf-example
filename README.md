# Darkone NixOS Project Example

An example NixOS deployment built on the
[Darkone NixOS Framework](https://github.com/darkone-linux/darkone-nixos-framework).

This template demonstrates the layout and entry points expected by the
framework. Use the [DNF Boilerplate](https://github.com/darkone-linux/dnf-boilerplate) to start a project.

## Structure

```
flake.nix          Consumer flake (delegates to dnf)
Justfile           Recipes (wraps dnf/assets/just/project.just)
etc/config.yaml    Declarative source of truth (hosts, users, network, services)
usr/               Local overlay
  modules/         Project-specific NixOS modules
  home/            Home Manager overlay
  machines/<host>/ Per-host artefacts (disko, hardware-configuration, generated-configuration)
  users/<login>/   Per-user customisations
  secrets/         SOPS-encrypted secrets (admin-managed, never edited here)
var/generated/     dnf-generator outputs — committed, do not edit
```

## Bootstrap

The framework's Justfile recipes and Rust generator are fetched from the
nix store, not from a local checkout. Run this once after cloning:

```sh
# Symlink .dnf -> framework's `assets` derivation (provides default.just)
nix run github:darkone-linux/darkone-nixos-framework#init

# Drop into a shell that has `dnf-generator` on PATH
nix develop github:darkone-linux/darkone-nixos-framework
```

After this, `just --list` shows the full set of framework recipes.

## Common commands

```sh
QUIET=1 just clean          # fix + generate + format + check
QUIET=1 just generate       # regenerate var/generated/ and modules/default.nix
QUIET=1 just check-flake    # nix flake check all systems
QUIET=1 just unit-tests     # Nix unit tests (dnf/lib/ changes)
```

## Pin to a released framework

```sh
nixos-rebuild switch --flake .#<host> \
  --override-input dnf github:darkone-linux/darkone-nixos-framework/<tag>
```
