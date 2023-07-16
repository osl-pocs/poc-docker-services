# PoC for Nginx and Docker

## Steps

* Create an account on ngrok.com
* Create a copy of .env.tpl to .env: `cp .env.tpl .env`
* In the `.env` file, add your NGROK token to the variable `NGROK_TOKEN`
* Run setup/ngrok.sh
* Check the logs for any errors and fix it: `docker-compose logs ngrok`
* If the previous command worked fine, it will show a url that will need to open. 
  In that page, it shows a domain, copy that and use it in the .env file for the variable
  SERVER_DOMAIN, e.g. `SERVER_DOMAIN=999b-999-9-999-999.ngrok-free.app`.
  Note: Don't copy the protocol part to the SERVER_DOMAIN (e.g. `https://`)
* If you are running it locally, add the ngrok subdomain to your `/etc/hosts`, for example:
  `127.0.0.1 999b-999-9-999-999.ngrok-free.app`. Every time you run `ngrok` container, you 
  will need to update `/etc/hosts`
* Run the script `./setup/run.sh`

## Troubleshoot

If you are having problems with ngrox x nginx, check if the ipv4 and ipv6 for your ngrok
url is working, e.g.:

```bash
$ curl -Ii4 9b7a-131-0-197-135.ngrok-free.app
$ curl -Ii6 9b7a-131-0-197-135.ngrok-free.app
```

## References

* https://mindsers.blog/post/https-using-nginx-certbot-docker/
* https://gist.github.com/maxivak/4706c87698d14e9de0918b6ea2a41015
