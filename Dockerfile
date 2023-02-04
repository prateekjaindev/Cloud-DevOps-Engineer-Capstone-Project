FROM nginx:1.23

RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html