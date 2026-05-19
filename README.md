# Darkone NixOS Project Example

An example NixOS deployment built on the
[Darkone NixOS Framework](https://github.com/darkone-linux/darkone-nixos-framework).

This template demonstrates the layout and entry points expected by the
framework. Use the [DNF Boilerplate](https://github.com/darkone-linux/dnf-boilerplate) to start a project.

## Structure

```
flake.nix          Consumer flake (delegates to dnf)
Justfile           Recipes (wraps dnf/assets/default.just)
etc/config.yaml    Declarative source of truth (hosts, users, network, services)
usr/               Local overlay
  modules/         Project-specific NixOS modules
  home/            Home Manager overlay
  machines/<host>/ Per-host artefacts (disko, hardware-configuration, generated-configuration)
  users/<login>/   Per-user customisations
  secrets/         SOPS-encrypted secrets (admin-managed, never edited here)
var/generated/     dnf-generator outputs — committed, do not edit
```

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
