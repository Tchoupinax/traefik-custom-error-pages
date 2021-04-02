FROM ubuntu as builder

RUN apt update && apt install -y wget git
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.82.0/hugo_extended_0.82.0_Linux-64bit.tar.gz
RUN tar xvzf hugo_extended_0.82.0_Linux-64bit.tar.gz
RUN cp hugo /usr/bin/hugo

RUN mkdir -p /var/www/errors
COPY . /var/www/errors
WORKDIR /var/www/errors

RUN hugo

##

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/

# COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /var/www/errors/public/ /usr/share/nginx/html/

EXPOSE 80
