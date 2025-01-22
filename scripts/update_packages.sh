#!/bin/sh -ex
cd "$(dirname $(realpath $0))/.."

curl 'https://swiftpackageindex.com/search?query=platform:linux&page=[0-250]' --compressed -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br, zstd' -H 'Referer: https://swiftpackageindex.com/search?query=platform%3Alinux' -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-User: ?1' -H 'Priority: u=0, i' -H 'TE: trailers' | sed 's;identifier;\n;g' | grep 'class="stars' | cut -f 3 -d '>' | cut -f 1 -d '<' | sort -u | jq -R --slurp 'split("\n") | map(select(length > 0))' > index/packages.json

