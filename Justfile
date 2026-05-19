# dnf-example — consumer Justfile.
# TODO: optional import (import?) local over global (in nix store)

import 'dnf/assets/default.just'

# Justfile help
_default:
	@just --list
