# Host profile for an administration laptop.
#
# Selected by `profile: "admin-laptop"` in `etc/config.yaml`, like the
# framework profiles of `dnf/modules/mixin/host/`. No `system.stateVersion`
# here: it is frozen per host in `usr/machines/<host>/install/state.nix`.
#
# Host profiles carry NixOS-level options only: hardware, system services,
# desktop stack. Per-user software (office suite, communication tools, music,
# media) is home-manager territory and belongs to the user's own file,
# `usr/users/<login>/default.nix`:
#
# ```nix
# darkone.home.office.enableCommunication = true;
# darkone.home.music.enable = true;
# ```
#
# :::note[Why the split matters]
# `darkone.home.*` options are unknown to the NixOS module system: setting them
# here fails the evaluation with "option does not exist". Same package, two
# namespaces, and the user file is the one that wins.
# :::

{ lib, config, ... }:
let
  cfg = config.darkone.host.admin-laptop;
in
{
  options = {
    darkone.host.admin-laptop.enable = lib.mkEnableOption "Darkone administration laptop";
  };

  config = lib.mkIf cfg.enable {

    # Darkone modules
    darkone = {

      # Based on laptop framework profile
      host.laptop.enable = true;

      # Nix administration features
      admin.nix.enable = true;

      # Printers
      #service.printing.enableHpPrinters = true;

      # Virtualbox
      #graphic.virtualbox.enable = true;

      # Gnome options
      #graphic.gnome.enableDashToDock = true;
      #graphic.gnome.enableGsConnect = true;
      #graphic.gnome.enableCaffeine = true;
    };
  };
}
