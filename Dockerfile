FROM nginx:1.13.5
LABEL maintainer="Claude Vessaz <claude.vessaz@safe.com>"

ENV WORKER_PROCESSES=auto
ENV CLIENT_MAX_BODY_SIZE=20m
ENV SERVER_NAME=_
ENV NGINX_WWW=/usr/share/nginx/html/public/

RUN mkdir -p /tmp/sockets $NGINX_WWW

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template

CMD ["bash", "-c", "envsubst '$NGINX_WWW $WORKER_PROCESSES $SERVER_NAME $CLIENT_MAX_BODY_SIZE' < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]