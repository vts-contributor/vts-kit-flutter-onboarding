FROM {{pullRegistry}}/library/nginx
WORKDIR /app
COPY cicd/configs/nginx.conf /etc/nginx/nginx.conf
COPY packages/demo/build/web /usr/share/nginx/html/