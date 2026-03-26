#!/usr/bin/env bash
set -uo pipefail
src=src/main.ag
dist=dist/main.sh
dirs=(dist)
rm -rf "${dirs[@]}"
mkdir -p "${dirs[@]}"
silver() {
	# shellcheck disable=SC2016
	printf '%s\n' \
		'#!/usr/bin/env bash' \
		'set -uo pipefail' \
		's() { echo "#include <$1>"; }'
	perl -pe 's|#.*$||g' "$src" \
		| tr ';' '\n' \
		| awk -f silver.awk
}
silver > "$dist"
cat "$dist"
