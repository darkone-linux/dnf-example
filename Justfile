# dnf-example — consumer Justfile.
#
# `dnf/` is a symlink to the framework tree in the nix store, laid down once by:
#   nix run github:darkone-linux/darkone-nixos-framework#init
# `import?` keeps `just --list` working (showing local recipes only) before
# the bootstrap runs.

import? 'dnf/just/project.just'
#import? 'dnf/just/codev.just'     # uncomment in a co-development workspace (dnf/ checkout)

# Justfile help
_default:
	@just --list
