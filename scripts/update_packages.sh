#!/bin/sh -ex
cd "$(dirname $(realpath $0))/.."

#curl 'https://swiftpackageindex.com/search?query=platform:linux&page=[0-250]' --compressed -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br, zstd' -H 'Referer: https://swiftpackageindex.com/search?query=platform%3Alinux' -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-User: ?1' -H 'Priority: u=0, i' -H 'TE: trailers' | sed 's;identifier;\n;g' | grep 'class="stars' | cut -f 3 -d '>' | cut -f 1 -d '<' | sort -u | jq -R --slurp 'split("\n") | map(select(length > 0))' > index/packages.json

curl 'https://swiftpackageindex.com/search?query=platform:linux&page=[0-250]' \
--compressed \
-X 'GET' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
-H 'Sec-Fetch-Site: none' \
-H 'Cookie: cf_clearance=wbwLum_2kkAn8a5_aiUbSY7m0rUTgnN1.TWoQjT_K84-1746118432-1.2.1.1-KzmvqXLQ1oCl4KGEnKoGjnxOldDhCAtJiPZHNxetXQNnaMzFW1j1YSgcItYF816yfPjbhglgy4Esc6l_.4rvddIFHc3NDhhb4qN5h8GbBGwTaDIowj4AuZXJSE.3FpxAGNtUbTI7t6o31E4m8qVNRKWJ5twPrjBn4do8.zY0IumyFOxvhBpcRasmlhrldFjS_61VK7tyhnTpmAbNBZoq1nMC5HyUHkNkS0stn_PbmoGGQRGbXGx6iJ3aHNfFnXsvVU_x1.6k.nAyUbkDKOloRu8UlaUwlOIlzsMuVRZKsr8l4.RsWbOR1DNPiT3.eNCAiEmCtaWlii7__LQ6SNRYnvAutfbXYApCfD0M3hGaBZY' \
-H 'Sec-Fetch-Mode: navigate' \
-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Safari/605.1.15' \
-H 'Accept-Language: en-US,en;q=0.9' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Sec-Fetch-Dest: document' \
-H 'Priority: u=0, i' \
    | sed 's;identifier;\n;g' | grep 'class="stars' | cut -f 3 -d '>' | cut -f 1 -d '<' | sort -u | jq -R --slurp 'split("\n") | map(select(length > 0))' > index/packages.json


