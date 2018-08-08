# tools
Just some regular tools for some regular stuff

This will be (hopefully) a growing collection of random tools to made SysAdmin/DevOps life easier.


## Contents
------

  * haproxy/generate-haproxy-ssl_fc.sh
> Generate a forced SSL block from a running site's SSL cert.  Just a SAN cert on a site,
> run this script, then stick the output into your haproxy.conf for per-domain 301 redirects.
*Usage*
```
./generate-haproxy-ssl_fc.sh <domain>
Where <domain> is your domain.  You can test with google.com.  Make sure openssl, awk and
standard Linux friends are installed.
```
<img width="682" alt="screen shot 2018-08-08 at 2 52 33 pm" src="https://user-images.githubusercontent.com/691270/43821092-bd8c7d02-9b1a-11e8-8141-7e32f4bb72a0.png">



