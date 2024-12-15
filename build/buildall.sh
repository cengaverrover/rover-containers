#!/bin/bash

SCRIPT_DIR="$(dirname $(readlink -f "$0"))"

for dockerfile in "$SCRIPT_DIR"/*/Dockerfile; do
    dir=$(dirname "$dockerfile")
    tag=$(basename "$dir")

    printf '\e[1;34m%-6s\e[m\n' "Building cengaver/$tag"
    
    (cd $dir && bash init)    
    docker build --no-cache -f "$dockerfile" -t "cengaver/$tag" "$dir"
    if [ $? -ne 0 ]; then
        printf '\e[1;31m%-6s\e[m\n' "!!!Failed to build image for $tag!!!"
	exit 1
    fi
done

printf '\e[1;32m%-6s\e[m\n' "All Dockerfiles have been successfully built!"
