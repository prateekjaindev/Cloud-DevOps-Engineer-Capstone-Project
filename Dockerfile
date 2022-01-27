FROM nginx:1.21.6

RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html