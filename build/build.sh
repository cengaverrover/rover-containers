#!/bin/bash

if [ -z "$1" ]; then
	printf '\e[1;31m%-6s\e[m\n' "None specified between:"
	for i in $(find "$(dirname "$(readlink -f "$0")")" -mindepth 1 -maxdepth 1 -type d); do
  		printf '\e[1;33m%-6s\e[m\n' "$(basename "$i")"
	done
	exit 1
fi

SCRIPT_DIR="$(dirname $(readlink -f "$0"))"

dockerfile="$SCRIPT_DIR/$1/Dockerfile"
dir=$(dirname "$dockerfile")
tag=$(basename "$dir")

docker build -f "$dockerfile" -t "cengaver/$tag" "$dir"
