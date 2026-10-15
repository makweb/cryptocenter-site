# Статика cryptocenter.finance (бывший App Platform static-site, catchall 404.html со статусом 200).
# База = задеплоенный коммит 078dbbe (30.09), НЕ main HEAD — репозиторий ушёл вперёд деплоя.
FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/Dockerfile && printf 'server {\n  listen 80;\n  root /usr/share/nginx/html;\n  index index.html;\n  location / { try_files $uri $uri/ /404.html; }\n}\n' > /etc/nginx/conf.d/default.conf
