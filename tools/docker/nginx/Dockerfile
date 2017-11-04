FROM nginx:stable-alpine
MAINTAINER rkaneko<kanek.o.dev@gmail.com>

COPY public/site /usr/share/nginx/html

EXPOSE 80
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'"]
