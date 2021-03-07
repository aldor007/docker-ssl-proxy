# FROM alpine:3.13.2
FROM nginx:1.19


RUN mkdir -p /etc/nginx/certs
ADD cert.pem /etc/nginx/certs
ADD key.pem /etc/nginx/certs
ADD nginx.conf  /etc/nginx/nginx.conf
RUN chmod 777 -R /etc/nginx/certs && chmod 777 -R /var && chmod 777 -R /run

EXPOSE 8443
