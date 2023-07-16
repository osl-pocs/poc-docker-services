version: 2
authtoken: ${NGROK_TOKEN}

tunnels:
  app:
    proto: http
    addr: ${NGINX_HOSTNAME}:80
