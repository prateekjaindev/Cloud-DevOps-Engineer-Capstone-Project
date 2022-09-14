FROM nginx:1.23.1

RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html