# Darkone NixOS Project Example

A reference deployment built on the
[Darkone NixOS Framework](https://github.com/darkone-linux/darkone-nixos-framework)
(DNF): a coordination server, two local zones with their gateway, a server,
desktops, laptops and a USB key, with the users of a family or a small office.

Read it to see how a real network is described. To start your own, use the
[DNF Boilerplate](https://github.com/darkone-linux/dnf-boilerplate) or the
installer image instead: this project ships no secrets and no hardware.

## What is where

| Path | What it holds |
|---|---|
| `etc/config.yaml` | The network: zones, users, hosts, services |
| `usr/machines/<host>/` | Files of one host: `configuration.nix` (yours), `install/` (frozen) |
| `usr/users/<login>/` | Customizations of one user |
| `usr/modules/` | Project NixOS modules: alert silences, an `admin-laptop` host profile |
| `usr/home/` | Project Home Manager modules and profiles |
| `var/generated/` | Written by `just generate`: committed, never edited |
| `dnf/` | Link to the framework release this project pins (`nix run .#init`) |

## Explore it

```sh
nix run .#init        # link dnf/ onto the pinned framework release
just                  # every command, by group
just generate         # regenerate var/generated/ from etc/config.yaml
just check-flake      # evaluate every host
```

`just generate` needs `dnf-generator`: enter the framework shell first with
`nix develop github:darkone-linux/darkone-nixos-framework`.

## Help

- Documentation: [English](https://darkone-linux.github.io/en/) •
  [Français](https://darkone-linux.github.io/fr/)
- The configuration file:
  [config.yaml reference](https://darkone-linux.github.io/en/doc/how-to/admin/config/)
