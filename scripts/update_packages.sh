#!/bin/sh -ex
cd "$(dirname $(realpath $0))/.."
curl 'https://swiftpackageindex.com/search?query=platform:linux&page=[0-250]' | sed 's;identifier;\n;g' | grep 'class="stars' | cut -f 3 -d '>' | cut -f 1 -d '<' | sort -u | jq -R --slurp 'split("\n") | map(select(length > 0))' > index/packages.json

