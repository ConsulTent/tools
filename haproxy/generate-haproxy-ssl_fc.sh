#!/bin/bash

# (C) 2018 Alexey Zilber @ ConsulTent, LTD - azilber@consultent.ltd

args=("$@")

if [ "${args[0]}" == "" ]; then
echo "Missing domain name to extract cert data from."
echo "Example: ./generate-haproxy-ssl_fc.sh google.com"
exit
fi

echo '#Copy/Paste everything below this line into a bind block in haproxy...'
echo '#SSL force related'
echo 'http-request add-header X-Proto https if { ssl_fc }'
echo 'http-request set-header X-Forwarded-Port %[dst_port]'
echo 'http-request add-header X-Forwarded-Proto https if { ssl_fc }'
echo " "
echo '#Domain block: '

for i in $(openssl s_client -showcerts -connect ${args[0]}:443 </dev/null 2>/dev/null | openssl x509 -noout -text | awk '/X509v3 Subject Alternative Name/ {getline;gsub(/ /,"",$0);gsub(/DNS:/,"",$0);gsub(/IPAddress:/,"",$0);gsub(/\*\./,"",$0);gsub(/\,/,"\n",$0);gsub(/www\./,"",$0); print}' | sort | uniq ); { 

echo "redirect scheme https code 301 if { hdr_end(Host) -i $i } !{ ssl_fc }";
}
echo '#End Domain block'

