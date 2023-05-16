FROM {{pullRegistry}}/library/nginx:1.20-alpine
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY build/web /usr/share/nginx/html/