# Реестр решений · cryptocenter-site (cryptocenter.finance + www + old)

Перенос статики с App Platform старого аккаунта на дроплет 178.62.221.69. Выполнен 15.10.2026.
Это ФОРК makweb/cryptocenter-site: в исходный BergMindset/cryptocenter-site доступ только на
чтение (пуш запрещён), ветка makweb живёт здесь.

1. **База ветки — задеплоенный коммит `078dbbe`** (деплой 30.09), НЕ main: main ушёл вперёд
   (a1ba4dd 03.10, у него en/light по умолчанию против ru/dark на проде). Паритет с продом.
2. **Единственная правка контента**: в `_nuxt/C6wsCKBM.js` константа бэкенда
   `https://cryptocenter-backend-86wky.ondigitalocean.app` → `https://api.cryptocenter.finance`
   (старый URL умрёт вместе с заблокированным аккаунтом). Бэкенд перенесён отдельно —
   см. makweb/cryptocenter-backend@makweb.
3. **Образ**: `registry.digitalocean.com/yldx-alpha-berg-work/cryptocenter-site:latest` —
   nginx:alpine, `try_files $uri $uri/ /404.html` (catchall 404.html со статусом 200,
   как у App Platform: несуществующий путь на проде отдавал 200).
4. **old.cryptocenter.finance**: приложение `cryptocenter-archive` в режиме archive отдавало 503 —
   воспроизведено блоком Caddy `respond 503`, без контейнера. Источник архива
   (BergMindset/cryptocenter-archive) не разворачивался.
5. **DNS cutover 15.10**: апекс A 162.159.140.98/172.66.0.96 → один A 178.62.221.69;
   AAAA апекса удалены (у дроплета нет IPv6); CNAME www и old → A 178.62.221.69 (TTL 300).
   MX/TXT yandex-почты не тронуты.
6. **Проверено**: апекс/www/страницы /markets/, /services/, /feed.xml и catchall —
   md5 байт-в-байт со старым продом; www 200; old 503.
