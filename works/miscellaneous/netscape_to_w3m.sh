#!/bin/bash
# Usage example:
# ./netscape_cookie_to_w3m.sh cookie_for_wget.txt > c4w3m && 
#   cp ~/.w3m/cookie ~/.w3m/cookie.bak && cp c4w3m ~/.w3m/cookie
egrep <"$1" -v '^($|#)' |
    while read domain bool1 path bool2 int1 name value; do
        if [[ $domain = \.* ]]; then url=https://${domain:1}/; else url=https://${domain}/; fi
        expires=$(date -dtomorrow +%s) # or we use int1, the original expire time
        portlist='' flag=13 version=0

        # If the domain is not an FQDN, but instead a host in the
        # default DNS search domain, apparently w3m and curl behave
        # differently in some way I don't understand.
        if ! [[ $domain =~ \. ]]; then
            domain=some-hard-coded-string # just www? let it through
        fi
        printf '%s\t' "$url" "$name" "$value" "$expires" "$domain" "$path" "$flag" "$version" "$portlist"
	echo
    done
