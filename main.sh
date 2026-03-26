#!/usr/bin/env bash
set -uo pipefail
src=src/main.ag
dist=dist/main.sh
dirs=(
	dist
)
rm -rf "${dirs[@]}"
mkdir -p "${dirs[@]}"
silver() {
	printf '%s\n' \
		'#!/usr/bin/env bash' \
		'set -uo pipefail'
	pre="$(perl -pe '
		s|\s*#.*$||g;
		s|\s*;\s*|\n|g;
	' "$src")"
	awk -f silver.awk <<< "$pre"
}
silver > "$dist"
cat "$dist"
