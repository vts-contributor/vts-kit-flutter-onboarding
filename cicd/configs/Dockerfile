FROM {{pullRegistry}}/library/nginx
WORKDIR /app
COPY nginx.conf /etc/nginx/nginx.conf
COPY packages/demo/build/web /usr/share/nginx/html/