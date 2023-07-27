# PoC for Nginx and Docker

## Steps

* Create a copy of .env.tpl to .env: `cp .env.tpl .env`
* If the previous command worked fine, it will show a url that will need to open.
  In that page, it shows a domain, copy that and use it in the .env file for the variable
  Note: Don't copy the protocol part to the SERVER_DOMAIN (e.g. `https://`)
* If you are running it locally, add the tje subdomain to your `/etc/hosts`, for example:
  `local.osl.org`.
* Run the script `./setup/run.sh`

## Troubleshoot

TBD

## References

* https://mindsers.blog/post/https-using-nginx-certbot-docker/
* https://gist.github.com/maxivak/4706c87698d14e9de0918b6ea2a41015
